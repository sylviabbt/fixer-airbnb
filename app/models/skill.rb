class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :title, presence: true
  validates :title, uniqueness: { scope: :user }
  validates :price_per_hour, presence: true
  validates :earliest_available, presence: true
  validates :latest_available, presence: true
end
