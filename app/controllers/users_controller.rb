class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def faq
  end

  private
    def user_params
      params.require(:user).permit(:name, :name_kana, :hundle_name, :email, :profile_image_id )
    end

end
