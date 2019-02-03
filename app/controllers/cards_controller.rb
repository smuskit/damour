class CardsController < ApplicationController

  def show
    user = User.find(params[:id])
    @cards = user.cards.all
    @card = Card.new
  end

  def get_prefectures
    render partial: 'select_prefecture', locals: {region_id: params[:region_id]}
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
