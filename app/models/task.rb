class Task < ApplicationRecord
  validates :item,
            uniqueness: true
end
