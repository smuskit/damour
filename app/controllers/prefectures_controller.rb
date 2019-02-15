class PrefecturesController < ApplicationController
  def show
    if params[:search]
      prefecture = Prefecture.find(params[:id])

      #検索用
      @dams = prefecture.dams.page(params[:page]).where('name LIKE ? OR name_kana LIKE ? OR address LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      prefecture = Prefecture.find(params[:id])

      #name_kana 並び替え（50音順）
      @dams = prefecture.dams.page(params[:page]).order :name_kana
    end

    @prefecture = Prefecture.find(params[:id])
    @region = @prefecture.region
    # @dams = @prefecture.dams.all.order :name_kana
  end
end

