class UniqMemberships < ActiveRecord::Migration[6.1]
  def change
    add_index :memberships, %i[user_id group_id], unique: true
  end
end
