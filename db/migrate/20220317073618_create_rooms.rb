class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :roomname
      t.text :roomintroduction
      t.string :room_image_id
      t.integer :fee
      t.string :adress

      t.timestamps
    end
  end
end
