class AddRoomIdToResavations < ActiveRecord::Migration[6.1]
  def change
    add_column :resavations, :room_id, :integer
  end
end
