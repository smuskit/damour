class AdminsController < ApplicationController

  before_action :authenticate_admin!

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
    def admin_params
      params.require(:admin).permit(:email)
    end

end
