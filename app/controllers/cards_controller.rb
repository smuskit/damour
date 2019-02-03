class CardsController < ApplicationController

  def top
    user = User.find(params[:id])
    @cards = user.cards.all
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
