class DamComment < ApplicationRecord

  belongs_to :user
  belongs_to :dam

  attachment :comment_image

  paginates_per 3
  default_scope { order 'created_at DESC' }

  validates :comment, presence: true, length: { minimum: 1, maximum: 330 }
end

