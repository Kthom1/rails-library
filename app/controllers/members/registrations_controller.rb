# frozen_string_literal: true

class Members::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  def create
    params[:user] = params[:user]&.merge(type: 'Member')
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[type])
  end
end
