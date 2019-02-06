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
      if card.images
        if card.images.all.last.dam_image.blank?
        card.images.all.last.destroy
        end
        if card.images.all.last.dam_image.blank?
          card.images.all.last.destroy
        end
      end
      flash.notice = 'カードを登録しました．'
      redirect_to card_path(current_user.id)
    else
      flash.notice = '入力に誤りがあります．'
      render 'show'
    end
  end

  def edit
    @card_edit = Card.find(params[:id])
    if @card_edit.images.blank?
      2.times { @card_edit.images.build }
    elsif @card_edit.images.count == 1
      1.times { @card_edit.images.build }
    end
    respond_to do |format|
      format.html{}
      format.js {}
    end
  end

  def update
    @user = User.find(current_user.id)
    @card = Card.find(params[:id])
    @card.user_id = current_user.id
    respond_to do |format|
      if @card.update(card_params)
        if @card.images.all.last.dam_image.blank?
        @card.images.all.last.destroy
        end
        if @card.images.all.last.dam_image.blank?
          @card.images.all.last.destroy
        end
        flash.notice = 'カードを更新しました．'
        format.html { redirect_to @user }
        format.js { render js: "window.location = '#{card_path(@user)}'" }
      else
        @bid.errors.each do |name, msg|
          flash.now[name] = msg
        end
        format.html { redirect_to @card }
        format.js { render partial: "shared/message", status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

    def card_params
      params.require(:card).permit(:region_id, :prefecture_id, :dam_name, :visit_date, :version_bf, :version_af, :version_y, :version_m, images_attributes: [:dam_image])
    end

end
