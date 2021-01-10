class ChangeColumnTypeInUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :birthday, :string
    add_column :users, :birthday, :datetime
  end
end
