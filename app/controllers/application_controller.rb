# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to '/'
  end

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

  def after_sign_in_path_for(_resource)
    return rails_admin_path if current_user.staff?

    root_path
  end
end
