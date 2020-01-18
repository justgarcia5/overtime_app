# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
require 'capybara/rspec'
include RequestHelpers

feature 'index' do
  let(:user) { create_logged_in_user }

  before do
    @post2 = Post.create!(date: Date.today, rationale: 'Post2', user_id: user.id)
    @post = Post.create!(date: Date.today, rationale: 'Post1', user_id: user.id)
    visit posts_path(user)
  end

  scenario 'can be reached successfully' do
    expect(page.status_code).to eq(200)
  end
  scenario 'has a title Posts' do
    expect(page).to have_content('Posts')
  end
  scenario 'has a of list Posts' do
    expect(page).to have_content(/Post2 | Post1/)
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
    fill_in 'post_date', with: Date.today
    fill_in 'post_rationale', with: 'Some rationale'
    click_on 'Submit'
    expect(page).to have_content('Some rationale')
  end
end

feature 'edit' do
  let(:user) { create_logged_in_user }

  before do
    @post = Post.create!(date: Date.today, rationale: 'Post1', user_id: user.id)
    visit edit_post_path(@post, user)
  end
  scenario 'user can edit posts' do
    fill_in 'post_date', with: Date.today
    fill_in 'post_rationale', with: 'Some rationale'
    click_on 'Submit'
    expect(page).to have_content('Some rationale')
  end
end
