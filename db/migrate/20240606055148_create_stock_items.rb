class CreateStockItems < ActiveRecord::Migration[7.0]
  def change
    create_table :stock_items do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.string :location

      t.timestamps
    end
  end
end
