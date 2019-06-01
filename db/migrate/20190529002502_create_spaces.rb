class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
    	t.string :name, null: false #リスト名
    	t.integer :room, null: false #部屋
    	t.datetime :r_at, null: true #時間

    	t.integer :user_id, null: true
      t.timestamps
    end
  end
end
