class FacilitiesController < ApplicationController
  def new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      flash[:destroy] = '#{@facility.name}の情報を削除しました．'
      redirect_to dams_top_path
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
  end

  def update
  end

  def destroy
  end

  private
    def facility_params
      params.require(:facility).permit(:name, :address, :opening_hours, :comment)
    end
end
