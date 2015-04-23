class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
   before_filter :configure_permitted_parameters, if: :devise_controller?
   
   protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:user) { |u| u.permit(:nombre, :apellido, :email, :password, :password_confirmation, :fechaNacimiento, :image, :genero, :admin ) }
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nombre, :apellido, :email, :password, :password_confirmation, :fechaNacimiento, :image, :genero ) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nombre, :apellido, :email, :password, :current_password, :fechaNacimiento, :image, :genero) }
        end

  
end
