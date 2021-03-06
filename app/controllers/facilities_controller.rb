class FacilitiesController < ApplicationController

  before_action :authenticate_admin!, except: [:show]

  def new
  end

  def create
    @facility = Facility.new(facility_params)

    if @facility.save
      flash[:notice] = "#{@facility.name}の情報を登録しました．"
      redirect_to facilities_path
    else
      flash[:alert] = '入力に誤りがあります．'
      render 'index'
    end
  end

  def index
    @facility = Facility.new

    if params[:search]
      #検索用
      @facilities = Facility.page(params[:page]).where('name LIKE ? OR name_kana LIKE ? OR address LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      #name_kana 並び替え（50音順）
      @facilities = Facility.page(params[:page]).order :name_kana
    end
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def edit
    @facilities = Facility.all
    @facility = Facility.find(params[:id])
  end

  def update
    facility = Facility.find(params[:id])
    if facility.update(facility_params)
      flash[:notice] = "#{facility.name}の情報を更新しました．"
      redirect_to facilities_path
    else
      flash[:alert] = '入力に誤りがあります．'
      render 'edit'
    end
  end

  def destroy
    facility = Facility.find(params[:id])
    facility.destroy
    flash[:notice] = "#{facility.name}の情報を削除しました．"
    redirect_to facilities_path
  end

  private
    def facility_params
      params.require(:facility).permit(:name, :name_kana, :address, :opening_hours, :closing_hours, :holiday, :business_period, :comment)
    end
end
