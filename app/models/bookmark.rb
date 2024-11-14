class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # Un film peut être dans plusieurs list mais unique dans une liste
  validates :movie, uniqueness: { scope: :list }
  validates :comment, presence: true, length: { minimum: 6 }
  # validates :comment, uniqueness: true

end
