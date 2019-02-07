class AdminsController < ApplicationController

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
  end

  private
    def admin_params
      params.require(:admin).permit(:email)
    end

end
