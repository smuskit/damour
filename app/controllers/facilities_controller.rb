class FacilitiesController < ApplicationController
  def new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to facilities_path, flash: {key: "#{@facility.name}の情報を登録しました．"}
    else
      flash[:destroy] = '入力に誤りがあります．'
      render 'index'
    end
  end

  def index
    @facility = Facility.new
    @facilities = Facility.all
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
  end

  def destroy
    facility = Facility.find(params[:id])
    facility.destroy
    redirect_to facilities_path, flash: {key: "#{facility.name}の情報を削除しました．"}
  end

  private
    def facility_params
      params.require(:facility).permit(:name, :address, :opening_hours, :comment)
    end
end
