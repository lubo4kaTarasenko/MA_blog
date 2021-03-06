class Group < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :images, as: :imageable

  enum status: %i[active archived removed permanently_removed]

  validates :name, presence: true, uniqueness: true
  validates :group_type, presence: true
  validates :status, presence: true

  def banned_users_emails
    memberships.banned.users.map(&:email)
  end

  def active_users_count
    memberships.active.count
  end

  def add_user_to_ban(user_id)
    memberships.where(user_id: user_id).update_all(status: :banned)
  end
end
