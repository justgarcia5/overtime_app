# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
include RequestHelpers

feature 'index' do
  let(:user) { create_logged_in_user }
  let(:admin) { create_logged_in_admin }
  before do
    @post = Post.create!(date: Date.today, rationale: 'Post1', user: admin)
    @post2 = Post.create!(date: Date.today, rationale: 'Post2', user: user)
    visit posts_path(user)
  end
  scenario 'can be reached successfully' do
    expect(page.status_code).to eq(200)
  end
  scenario 'has a title Posts' do
    expect(page).to have_content('Posts')
  end
  scenario 'has a list of Posts' do
    expect(page).to have_content(/Post2 | Post1/)
  end
  scenario 'has a scope so that only post creators can see their posts' do
    visit posts_path(user)
    expect(page).to_not have_content(/Post1/)
  end
end

feature 'creation' do
  let(:user) { create_logged_in_user }
  before do
    visit new_post_path(user)
  end
  scenario 'has a new form that can be reached' do
    expect(page.status_code).to eq(200)
  end
  scenario 'can be created from new form page' do
    expect(page).to have_content('New Post')
    fill_in 'date', with: Date.today
    fill_in 'rationale', with: 'Some rationale'
    click_on 'Submit'
    expect(page).to have_content('Some rationale')
  end
  scenario 'link to new post page on navtab' do
    visit root_path
    click_on 'new-entry'
    expect(page).to have_content('New Post')
  end
  scenario 'can see flash message on create' do
    expect(page).to have_content('New Post')
    fill_in 'date', with: Date.today
    fill_in 'rationale', with: 'Some rationale'
    click_on 'Submit'
    expect(page).to have_content('Your post was created successfully')
  end
end

feature 'edit' do
  let(:user) { create_logged_in_user }
  before do
    @post = Post.create!(date: Date.today, rationale: 'Post1', user: user)
    visit posts_path(user)
  end
  scenario 'user can click edit button and on index page' do
    click_link 'Edit'
    visit edit_post_path(@post, user)
    expect(page).to have_content('Edit Post')
    expect(page).to have_content('Post1')
  end
  scenario 'it can be edited' do
    visit edit_post_path(@post, user)
    fill_in 'date', with: Date.yesterday
    fill_in 'rationale', with: 'Edited post'
    click_button 'Submit'
    expect(page).to have_content('Edited post')
  end
  scenario 'can see flash message on updated post' do
    visit edit_post_path(@post, user)
    expect(page).to have_content('Edit Post')
    fill_in 'date', with: Date.today
    fill_in 'rationale', with: 'Some rationale'
    click_on 'Submit'
    expect(page).to have_content('Your post was updated successfully')
  end
  scenario 'cannot be made by non authorized user' do
    logout(user)
    non_auth_user = FactoryBot.create(:non_authorized_user)
    login(non_auth_user)
    visit edit_post_path(@post)
    expect(current_path).to eq(root_path)
  end
end

feature 'delete' do
  let(:user) { create_logged_in_user }
  before do
    @post = Post.create!(date: Date.today, rationale: 'Post1', user: user)
  end
  scenario 'it can be deleted' do
    visit posts_path
    expect { click_link '', class: 'no-link' }.to change(Post, :count).by(-1)
  end
  scenario 'can see flash message on post delete' do
    visit posts_path(@post, user)
    expect(page).to have_content('Posts')
    expect { click_link '', class: 'no-link' }.to change(Post, :count).by(-1)
    expect(page).to have_content('Your post was deleted successfully')
  end
end
