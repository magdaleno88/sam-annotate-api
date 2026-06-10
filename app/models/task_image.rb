class TaskImage < ApplicationRecord
  belongs_to :task
  belongs_to :image
end
