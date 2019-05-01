class Dog < ApplicationRecord
  belongs_to :owner
  has_and_belongs_to_many :appointments
end
