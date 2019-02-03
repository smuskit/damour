class DamsController < ApplicationController

  def top
  end

  def prefecture
    @prefecture = Prefecture.find(params[:id])
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  def search
  end

  def management
  end

  private
    def prefecture_params
      params.require(:prefecture).permit(:region_id, :name)
    end

end
