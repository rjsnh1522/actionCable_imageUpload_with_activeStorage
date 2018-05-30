class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, presence: true, uniqueness: true
  validates :password,presence: true
  validates :password_confirmation,presence: true
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   
   has_many :images,dependent: :destroy
end
