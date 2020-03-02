# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(_resource)
    root_path
  end
end
