# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
require 'capybara/rspec'
include RequestHelpers

feature 'index' do
  let(:user) { create_logged_in_user }
  scenario 'can be reached successfully' do
    visit posts_path(user)
    expect(page.status_code).to eq(200)
  end
  scenario 'has a little Posts' do
    visit posts_path(user)
    expect(page).to have_content('Posts')
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
  # scenario 'can be created from new form page' do
  #   # byebug
  #   expect(page).to have_content('New Post')
  #   fill_in 'date', with: Date.today
  #   fill_in 'rationale', with: 'Some rationale'
  #   click_on 'Submit'
  #   expect(page).to have_content('Some rationale')
  # end
end
