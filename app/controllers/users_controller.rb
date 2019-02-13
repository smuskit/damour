class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
  end

  def faq
  end

  def cardlist
    @user = User.find(params[:id])
    @cards = @user.cards.page(params[:page_0]).reverse_order
    @cards_hokkaido = @user.cards.page(params[:page_1]).where(region_id: 1).reverse_order
    @cards_tohoku = @user.cards.page(params[:page_2]).where(region_id: 2).reverse_order
    @cards_kanto = @user.cards.page(params[:page_3]).where(region_id: 3).reverse_order
    @cards_hokuriku = @user.cards.page(params[:page_4]).where(region_id: 4).reverse_order
    @cards_tokai = @user.cards.page(params[:page_5]).where(region_id: 5).reverse_order
    @cards_kinki = @user.cards.page(params[:page_6]).where(region_id: 6).reverse_order
    @cards_chugoku = @user.cards.page(params[:page_7]).where(region_id: 7).reverse_order
    @cards_shikoku = @user.cards.page(params[:page_8]).where(region_id: 8).reverse_order
    @cards_kyushu = @user.cards.page(params[:page_9]).where(region_id: 9).reverse_order
    @card = Card.new
  end

  private
    def user_params
      params.require(:user).permit(:name, :name_kana, :hundle_name, :email, :profile_image)
    end

end
