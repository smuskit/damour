class InquiryMailer < ApplicationMailer
  default from: "damour@example.com"   # 送信元アドレス
  default to: ENV['ADDRESS_KEY']     # 送信先アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail to: ENV['ADDRESS_KEY'], :subject => 'お問い合わせを承りました'
  end
end
