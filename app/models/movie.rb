class Movie < ApplicationRecord
  # Pas de dépendance destroy entre movie et bookmarks on on ne veut pas d'automatisme
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, :overview, presence: true
  validates :title, uniqueness: true
  # validates :poster_url, format:
  # { with: /\A(http|https):\/\/[a-zA-Z0-9\-_]+(\.[a-zA-Z0-9\-_]+)+(:\d+)?(\/[^\s]*)?\z/i,
  #   message: "is invalid" }
end
