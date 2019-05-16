class AddCdayToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :c_day, :date
  end
end
