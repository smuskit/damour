class UsersController < ApplicationController

  before_action :correct_user, only: [:show, :edit, :update, :cardlist]

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end
  end

  def index
    if current_admin
      if params[:search]
        #検索用
        @users = User.page(params[:page]).where('name LIKE ? OR name_kana LIKE ? OR hundle_name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
      else
        #name_kana 並び替え（50音順）
        @users = User.page(params[:page]).order :name_kana
      end
    else
      redirect_to root_path
    end
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
      flash[:success] = "#{@user.name}さんのユーザ情報を更新しました．"
      redirect_to user_path(@user.id)
    else
      flash[:destroy] = "入力に誤りがあります．"
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
      if  user.destroy
          flash[:destroy] = '#{user.name}の情報を削除しました．'
          redirect_to users_index_path
      else
        render action: :new
      end
  end

  def about
  end

  def cardlist
    if current_user
      @user = User.find(params[:id])
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
      @card = Card.new
    else
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :name_kana, :hundle_name, :email, :profile_image)
    end

end
