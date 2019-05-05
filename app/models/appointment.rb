class Appointment < ApplicationRecord
  belongs_to :walker
  has_many :walks, dependent: :destroy
  has_many :dogs, through: :walks, dependent: :destroy
  has_many :trackings, dependent: :destroy
end
