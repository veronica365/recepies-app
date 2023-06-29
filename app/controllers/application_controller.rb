class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :_private_record_not_found

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password)
    end
  end

  def _private_record_not_found
    respond_to do |format|
      format.html { render 'shared/_404' }
      format.json { render json: { errors: 'The details no longer exist' }, status: :not_found }
    end
  end
end
