class AddRoomToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :room, :integer
  end
end
