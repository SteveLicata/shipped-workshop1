class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
  end

  def after_sign_in_path_for(resource)
    company_path(resource.id)


  puts "this is the sauce"
  puts resource
  end
end
