class Walker < ApplicationRecord
  has_many :appointments, dependent: :destroy
end