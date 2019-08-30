# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @topics = Topic.with_attached_main_picture.all
  end

private
protected

	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address])
  end

	def is_admin?
		redirect_to new_user_session_path unless (current_user && current_user.admin?)
	end

	def after_sign_in_path_for(resource)
  	stored_location_for(resource) || topics_path
	end

end
