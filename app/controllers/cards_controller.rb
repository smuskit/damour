class CardsController < ApplicationController

  def show
    @user = User.find(params[:id])
    @cards = @user.cards.all
    @cards_hokkaido = @user.cards.all.where(region_id: 1)
    @cards_tohoku = @user.cards.all.where(region_id: 2)
    @cards_kanto = @user.cards.all.where(region_id: 3)
    @cards_hokuriku = @user.cards.all.where(region_id: 4)
    @cards_tokai = @user.cards.all.where(region_id: 5)
    @cards_kinki = @user.cards.all.where(region_id: 6)
    @cards_chugoku = @user.cards.all.where(region_id: 7)
    @cards_shikoku = @user.cards.all.where(region_id: 8)
    @cards_kyushu = @user.cards.all.where(region_id: 9)
    @card = Card.new
    2.times { @card.images.build }
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
      params.require(:card).permit(:region_id, :prefecture_id, :dam_name, :visit_date, :version_bf, :version_af, :version_y, :version_m, images_attributes: [:dam_image])
    end

end
