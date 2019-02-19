class Card < ApplicationRecord
  belongs_to :region
  belongs_to :prefecture
  belongs_to :user

  attachment :card_image

  # validates :dam_name, :presence => {:message => '必須事項を入力してください'}, length: { minimum: 1, maximum: 12 }

  validate :add_error_sample

  def add_error_sample
    # nameが空のときにエラーメッセージを追加する
    if dam_name.blank?
      errors[:base] << "ダム名を入力してください"
    elsif dam_name.length > 12
      errors[:base] << "ダム名は12文字以下で入力してください"
    end
  end
end
