class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passangers
  accepts_nested_attributes_for :passangers
end
