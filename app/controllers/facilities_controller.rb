class FacilitiesController < ApplicationController

  def new
  end

  def create
    @facility = Facility.new(facility_params)

    if @facility.save
      redirect_to facilities_path, flash: {key: "#{@facility.name}の情報を登録しました．"}
    else
      flash[:create] = '入力に誤りがあります．'
      render 'index'
    end
  end

  def index
    @facility = Facility.new
    @facilities = Facility.all
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    facility = Facility.find(params[:id])
    if facility.update(facility_params)
      redirect_to facilities_path, flash: {key: "#{facility.name}の情報を更新しました．"}
    else
      flash[:update] = '入力に誤りがあります．'
      render 'edit'
    end
  end

  def destroy
    facility = Facility.find(params[:id])
    facility.destroy
    redirect_to facilities_path, flash: {key: "#{facility.name}の情報を削除しました．"}
  end

  private
    def facility_params
      params.require(:facility).permit(:name, :name_kana, :address, :opening_hours, :closing_hours, :holiday, :business_period, :comment)
    end
end
