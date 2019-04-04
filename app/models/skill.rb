class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings

  validates :title, presence: true
  validates :price_per_hour, presence: true
  validates :earliest_available, presence: true
  validates :latest_available, presence: true
end
