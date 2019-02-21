class CardsController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def show
    @card = Card.find(params[:id])
    if @card.user == current_user || current_admin
    else
      redirect_to root_path
    end
  end

  def get_prefectures
    render partial: 'select_prefecture', locals: {region_id: params[:region_id]}
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id
    if @card.save
      flash[:success] = "「#{@card.dam_name}」のカードを「#{@card.region.name}」に追加しました！"
      redirect_to card_path(@card.id)
    else
      flash[:danger] = 'カードの投稿に失敗しました'
      @user = User.find(current_user.id)
      @cards_hokkaido = @user.cards.all.where(region_id: 1).reverse_order
      @cards_tohoku = @user.cards.all.where(region_id: 2).reverse_order
      @cards_kanto = @user.cards.all.where(region_id: 3).reverse_order
      @cards_hokuriku = @user.cards.all.where(region_id: 4).reverse_order
      @cards_tokai = @user.cards.all.where(region_id: 5).reverse_order
      @cards_kinki = @user.cards.all.where(region_id: 6).reverse_order
      @cards_chugoku = @user.cards.all.where(region_id: 7).reverse_order
      @cards_shikoku = @user.cards.all.where(region_id: 8).reverse_order
      @cards_kyushu = @user.cards.all.where(region_id: 9).reverse_order
      @cards = @user.cards.all.reverse_order
      render 'users/cardlist'
    end
  end

  def edit
    @card_edit = Card.find(params[:id])
    redirect_to root_path unless @card_edit.user_id == current_user.id
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
        flash[:success] = "「#{@card.dam_name}」のカード情報を更新しました！"
        format.html { redirect_to @user }
        format.js { render js: "window.location = '#{card_path(@card)}'" }
      else
      #   format.html { render :edit }
      #   format.json { render json: @card.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end

  def destroy
    card = Card.find(params[:id])
    user = card.user
    card.destroy
    redirect_to cardlist_path(current_user)
  end

  private

    def card_params
      params.require(:card).permit(:region_id, :prefecture_id, :dam_name, :visit_date, :version_bf, :version_af, :version_y, :version_m, :card_image)
    end

end
