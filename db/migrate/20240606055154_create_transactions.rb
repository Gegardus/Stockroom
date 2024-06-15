class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :stock_item, null: false, foreign_key: true
      t.integer :quantity
      t.string :transaction_type

      t.timestamps
    end
  end
end
