class PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id])
    @region = @prefecture.region
    @dams = @prefecture.dams.all
  end
end
