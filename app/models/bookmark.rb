class Bookmark < ApplicationRecord
  validates :comment, presence: true, length: { minimum: 7 }
  validates :comment, uniqueness: { case_sensitive: false }

  belongs_to :movies
  belongs_to :lists
end
