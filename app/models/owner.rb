class Owner < ApplicationRecord
    has_many :dogs, dependent: :destroy
end
