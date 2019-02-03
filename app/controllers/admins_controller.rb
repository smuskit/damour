class AdminsController < ApplicationController

  def show
  end

  def edit
  end

  private
    def admin_params
      params.require(:user).permit(:name, :name_kana, :hundle_name, :email, :profile_image_id )
    end

end
