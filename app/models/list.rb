class List < ApplicationRecord
  # destruction automatique des bookmarks dépendants si suppression list
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true
  validates :name, uniqueness: true

end
