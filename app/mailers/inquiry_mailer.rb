class InquiryMailer < ApplicationMailer
  default from: "damour@example.com"   # 送信元アドレス
  default to: "k.shimouse@gmail.com"     # 送信先アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end
end
