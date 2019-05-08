class Appointment < ApplicationRecord
  belongs_to :walker
  has_many :walks, dependent: :destroy
  has_many :dogs, through: :walks, dependent: :destroy
  has_many :trackings, dependent: :destroy
  validates :location, presence: true
  validates :note, presence: true
  validates :duration, presence: true
end
