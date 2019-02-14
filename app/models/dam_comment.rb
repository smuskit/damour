class DamComment < ApplicationRecord

  belongs_to :user
  belongs_to :dam

  attachment :comment_image
end
