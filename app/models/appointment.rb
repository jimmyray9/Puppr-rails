class Appointment < ApplicationRecord
  belongs_to :walker, dependent: :destroy
  has_many :walks 
  has_many :dogs, through: :walks
end
