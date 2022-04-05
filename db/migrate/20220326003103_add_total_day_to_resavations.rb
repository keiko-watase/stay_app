class AddTotalDayToResavations < ActiveRecord::Migration[6.1]
  def change
    add_column :resavations, :total_day, :string
  end
end
