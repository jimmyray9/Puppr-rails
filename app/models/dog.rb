class Dog < ApplicationRecord
  belongs_to :owner
  has_many :walks, dependent: :destroy
  has_many :appointments, through: :walks, dependent: :destroy
end
