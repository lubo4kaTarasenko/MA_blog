class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :images, as: :imageable
  has_many :memberships
  has_many :groups, through: :memberships

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :password, presence: true, length: { minimum: 8, maximum: 50 }, unless: :persisted?

  validates :email, presence: true, length: {
    minimum: 5, maximum: 50
  }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # validates :username, presence: true, uniqueness: true

  scope :adult, -> { where('birthday <= ?', 18.years.ago) }

  def full_name
    "#{first_name} #{last_name} "
  end
end
