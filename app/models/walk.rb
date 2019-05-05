class Walk < ApplicationRecord
  belongs_to :dog, dependent: :destroy
  belongs_to :appointment, dependent: :destroy
end
