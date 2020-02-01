require 'spec_helper'

include Warden::Test::Helpers
module RequestHelpers
  def create_logged_in_user
    user = FactoryBot.create(:user)
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end

  def create_logged_in_admin
    admin = FactoryBot.create(:admin)
    login(admin)
    admin
  end
end
