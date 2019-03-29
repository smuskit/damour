class InquiryController < ApplicationController
  def index
    # 入力画面を表示
    @inquiry = Inquiry.new
    @user = User.find(current_user.id)
    render :action => 'index'
  end

  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      @user = User.find(current_user.id)
      render :action => 'index'
    end
  end

  def back
    @inquiry = Inquiry.new(inquiry_params)
    @user = User.find(current_user.id)
    render 'index'
  end

  def thanks
    # メール送信
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver

    # 完了画面を表示
    render :action => 'thanks'
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :message)
  end
end
