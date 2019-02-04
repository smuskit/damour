class DamsController < ApplicationController

  def top
  end

  def new
    @dam = Dam.new
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
