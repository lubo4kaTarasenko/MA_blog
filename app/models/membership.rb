class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :user

  enum status: %i[unactive active banned]

  validates :status, presence: true
end
