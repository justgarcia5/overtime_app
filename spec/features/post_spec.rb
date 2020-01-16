# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

describe 'navigate' do
  feature 'index' do
    scenario 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    scenario 'has a little Posts' do
      visit posts_path
      expect(page).to have_content('Posts')
    end
  end

  feature 'creation' do
    before do
      visit new_post_path
    end

    scenario 'has a new form that can be reached' do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end
    scenario 'can be created from new form page' do
      # byebug
      expect(page).to have_content('New Post')
      # fill_in 'date', with: Date.today
      # fill_in 'rationale', with: 'Some rationale'
      # click_on "Submit"
      # expect(page).to have_content('Some rationale')
    end
  end
end
