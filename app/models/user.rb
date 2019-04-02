class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :skills, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true, uniqueness: true
  validates :contact_info, presence: true, uniqueness: true
end
