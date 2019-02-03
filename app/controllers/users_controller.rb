class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
  end

  def faq
  end

  private
    def user_params
      params.require(:user).permit(:name, :name_kana, :hundle_name, :email, :profile_image)
    end

end
