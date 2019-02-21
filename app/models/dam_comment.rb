class DamComment < ApplicationRecord

  belongs_to :user
  belongs_to :dam

  attachment :comment_image

  paginates_per 3
  default_scope { order 'created_at DESC' }

  # validates :comment, presence: true, length: { minimum: 1, maximum: 330 }


  validate :add_error_sample

  def add_error_sample
    if comment.blank?
      errors[:base] << "投稿本文は入力必須項目です"
    elsif comment.length > 330
      errors[:base] << "投稿本文は1文字以上，330文字以内で入力してください"
    end
  end
end

