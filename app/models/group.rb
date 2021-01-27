class Group < ApplicationRecord
  has_many :memberships, dependent: :destroy  
  has_many :users, through: :memberships
  has_many :images, as: :imageable

  enum status: [ :active, :archived, :removed, :permanently_removed ]

  validates :name, presence: true, uniqueness: true
  validates :group_type, presence: true
  validates :status, presence: true
end
