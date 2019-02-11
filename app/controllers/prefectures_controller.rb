class PrefecturesController < ApplicationController
  def show
    if params[:search]
      prefecture = Prefecture.find(params[:id])
      @dams = prefecture.dams.all.where('name_kana LIKE ?', "%#{params[:search]}%")
    else
      prefecture = Prefecture.find(params[:id])
      @dams = prefecture.dams.all.order :name_kana
    end

    @prefecture = Prefecture.find(params[:id])
    @region = @prefecture.region
    # @dams = @prefecture.dams.all.order :name_kana
  end
end

