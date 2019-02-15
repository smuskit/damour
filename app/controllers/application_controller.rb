class ApplicationController < ActionController::Base

  before_action :store_user_location!, if: :storable_location?
	before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   # case resource
  #   # # when User
  #   # #   cardlist_path(current_user.id)
  #   # when Admin
  #     admin_path(current_admin.id)
  #   # end
  # end

  def after_sign_out_path_for(resource)
    root_path
  end

  def header
    @admin = Admin.find(1)
  end

  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
	  end

    #ログイン前のページにリダイレクト
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
    end
    #ログイン前のページにリダイレクト
end
