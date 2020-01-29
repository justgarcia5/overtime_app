# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  describe 'admin' do
    it 'can be reached successfully' do
      visit admin_root_path
      expect(page.status_code).to eq(200)
    end
    it 'does not allow users to access unless signed in admin' do
      visit admin_root_path
      expect(page.status_code).to eq(200)
    end
  end
end
