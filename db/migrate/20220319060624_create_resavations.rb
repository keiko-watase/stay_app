class CreateResavations < ActiveRecord::Migration[6.1]
  def change
    create_table :resavations do |t|
      t.integer :user_id
      t.date :start_at
      t.date :end_at
      t.integer :people_number

      t.timestamps
    end
  end
end
