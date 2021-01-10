class AddpolymorphicColumnToImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :images, :imageable, polymorphic: true
  end
end
