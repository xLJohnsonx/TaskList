class Task < ApplicationRecord
  validates_presence_of :item,
                        :message => 'you must enter a task'
                         # uniqueness: true
end
