class AddAssociations < ActiveRecord::Migration[6.1]
  def change
    add_reference :memberships, :user, foreign_key: true
    add_reference :memberships, :group, foreign_key: true
  end
end
