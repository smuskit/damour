class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when User
      card_top_path(current_user.id)
    when Admin
      admin_path(current_admin.id)
    end
  end

  def after_sign_out_path_for(resource)
    dams_top_path
  end

  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
	  end
end
