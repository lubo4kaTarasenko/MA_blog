class AddDefaultStatuses < ActiveRecord::Migration[6.1]
  def change
    change_column :groups, :status, :integer, default: 0
    change_column :memberships, :status, :integer, default: 0
  end
end
