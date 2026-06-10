class Task < ApplicationRecord


has_many :task_images


has_many :images,
through: :task_images


end