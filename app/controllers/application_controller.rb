# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    return edit_user_registration_path if current_user.member?
    return rails_admin_path if current_user.staff?

    root_path
  end
end
