class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?

     #Override path after sign in
     def after_sign_in_path_for(resource)
          board_path
     end

     protected

     def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :firstname, :lastname, :company_id)}
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :avatar, :firstname, :lastname, :position, :company_id, :picture)}
     end
end
