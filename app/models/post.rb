class Post < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable

  validates :title, presence: true
  validates :body, presence: true

  scope :published, -> {where.not(published_at: nil)}
end
