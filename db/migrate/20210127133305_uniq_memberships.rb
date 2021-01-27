class UniqMemberships < ActiveRecord::Migration[6.1]
  def change
    add_index :memberships, [:user_id, :group_id], unique: true
  end
end
