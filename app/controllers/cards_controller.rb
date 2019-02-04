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
    card = Card.new(card_params)
    card.user_id = current_user.id
    if card.save
      flash.notice = 'カードを登録しました．'
      redirect_to card_path(current_user.id)
    else
      flash.notice = '入力に誤りがあります．'
      render 'show'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def card_params
      params.require(:card).permit(:region_id, :prefecture_id, :dam_name, :visit_date, :varsion_bf, :varsion_af, :varsion_y, :varsion_m, {images: []})
    end

end
