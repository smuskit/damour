class Inquiry < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validate :add_error_sample
  def add_error_sample
    if message.blank?
      errors[:base] << "お問い合わせ内容を入力してください"
    elsif message.length > 500
      errors[:base] << "申し訳ありません．お問い合わせ内容は「500文字以内」で入力してください．"
    end
  end

end
