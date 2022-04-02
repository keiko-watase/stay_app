class AddTotalPriceToResavations < ActiveRecord::Migration[6.1]
  def change
    add_column :resavations, :total_price, :integer
  end
end
