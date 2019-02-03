class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

<<<<<<< HEAD
  has_many :cards, dependent: :destroy
=======
  attachment :profile_image
>>>>>>> 3e0dfa988e16dee9088a73097dde608705c811ca
end
