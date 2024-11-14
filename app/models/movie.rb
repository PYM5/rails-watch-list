class Movie < ApplicationRecord
  validates :title, :overview, presence: true
  validates :title, uniqueness: { case_sensitive: false }
  # validates :poster_url, format:
  # { with: /\A(http|https):\/\/[a-zA-Z0-9\-_]+(\.[a-zA-Z0-9\-_]+)+(:\d+)?(\/[^\s]*)?\z/i,
  #   message: "is invalid" }
  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks
end
