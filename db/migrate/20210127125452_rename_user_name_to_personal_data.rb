class RenameUserNameToPersonalData < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :username, :string
    add_column :users, :personal_data, :json
  end
end
