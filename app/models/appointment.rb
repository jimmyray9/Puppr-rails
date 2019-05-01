class Appointment < ApplicationRecord
  belongs_to :walker
  has_many :walks 
  has_many :dogs, through:  :walks
end
