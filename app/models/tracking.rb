class Tracking < ApplicationRecord
  belongs_to :appointment, dependent: :destroy
end
