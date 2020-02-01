# frozen_string_literal: true

require 'rails_helper'

feature 'admin dashbooard' do
  let(:user) { create_logged_in_user }
  let(:admin) { create_logged_in_admin }
  scenario 'does not allow users to access unless signed in admin' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end
  scenario 'cannot be reached by a non admin' do
    login(user)
    visit admin_root_path
    expect(current_path).to eq(root_path)
  end
  scenario 'can be reached by an admin user' do
    login(admin)
    visit admin_root_path
    expect(current_path).to eq(admin_root_path)
  end
end
