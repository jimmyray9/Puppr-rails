class Dog < ApplicationRecord
  belongs_to :owner
  has_many :walks, dependent: :destroy
  has_many :appointments, through: :walks, dependent: :destroy
  # validates :name, presence: true
  # validates :pic, presence: true
  # validates :age, presence: true
  # validates :description, presence: true
end
