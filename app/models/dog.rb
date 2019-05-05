class Dog < ApplicationRecord
  belongs_to :owner, dependent: :destroy
end
