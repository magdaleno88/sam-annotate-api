class Image < ApplicationRecord


has_one_attached :file


has_many :annotations


has_many :task_images


has_many :tasks,
through: :task_images


end