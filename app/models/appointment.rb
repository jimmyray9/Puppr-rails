class Appointment < ApplicationRecord
  belongs_to :walker
  has_and_belongs_to_many :dogs
end
