class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :reviews, dependent: :destroy

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :address, presence: true
  validates :total_price, presence: true
end
