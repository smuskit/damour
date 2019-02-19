class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cards, dependent: :destroy
  has_many :dam_comments, dependent: :destroy

  attachment :profile_image

  validate :add_error_sample
  def add_error_sample
    if name.blank?
      errors[:base] << "お名前を入力してください"
    elsif name.length > 20
      errors[:base] << "お名前は1文字以上，20文字以内で入力してください"
    end

    if name_kana.blank?
      errors[:base] << "ふりがなを入力してください"
    elsif name_kana.length > 30
      errors[:base] << "ふりがなは1文字以上，30文字以内で入力してください"
    end

    # nameが空のときにエラーメッセージを追加する
    if email.length > 50
      errors[:base] << "申し訳ありません．メールアドレスは50文字以下のものをご使用ください"
    end
  end

end

