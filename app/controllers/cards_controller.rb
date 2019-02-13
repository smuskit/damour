class CardsController < ApplicationController

  def show
    @card = Card.find(params[:id])
    # 2.times { @card.images.build }
  end

  def get_prefectures
    render partial: 'select_prefecture', locals: {region_id: params[:region_id]}
  end

  def create
    card = Card.new(card_params)
    card.user_id = current_user.id
    if card.save
      flash.notice = 'カードを登録しました．'
      redirect_to cardlist_path(current_user.id)
    else
      flash.notice = '入力に誤りがあります．'
      render 'show'
    end
  end

  def edit
    @card_edit = Card.find(params[:id])
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
        flash.notice = 'カードを更新しました．'
        format.html { redirect_to @user }
        format.js { render js: "window.location = '#{card_path(@card)}'" }
      else
        @card.errors.each do |name, msg|
          flash.now[name] = msg
        end
        format.html { redirect_to @card }
        format.js { render partial: "shared/message", status: :unprocessable_entity }
      end
    end
  end

  def destroy
    card = Card.find(params[:id])
    card.destroy
    redirect_to card_path(current_user)
  end

  private

    def card_params
      params.require(:card).permit(:region_id, :prefecture_id, :dam_name, :visit_date, :version_bf, :version_af, :version_y, :version_m, :card_image)
    end

end
