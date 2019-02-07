class ImagesController < ApplicationController
  def show
    @images = Image.where(card_id: params[:card_id])
  end
end
