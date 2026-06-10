class Annotation < ApplicationRecord
  belongs_to :user
  belongs_to :image
  belongs_to :classification_class
end
