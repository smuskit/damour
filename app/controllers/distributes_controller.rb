class DistributesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @distribute = Distribute.new
    @distributes = Distribute.page(params[:page]).order :dam_id
  end

  def create
    @distribute = Distribute.new(distribute_params)
    if @distribute.save
      flash[:notice] = '登録OK!'
      redirect_to distributes_path
    else
      flash[:alert] = '再入力'
      @distributes = Distribute.page(params[:page]).order :dam_id
      render 'index'
    end
  end

  def destroy
    distribute = Distribute.find(params[:id])
    if distribute.destroy
      flash[:notice] = '削除完了'
      redirect_to distributes_path
    else
      flash[:alert] = '削除失敗'
      render 'index'
    end
  end

  private
    def distribute_params
      params.require(:distribute).permit(:dam_id, :facility_id)
    end
end
