# app/models/stock_item.rb
class StockItem < ApplicationRecord
  belongs_to :product
  has_many :transactions

  def add_stock(quantity)
    self.quantity += quantity
    transactions.create(quantity: quantity, transaction_type: 'add')
    save
  end

  def remove_stock(quantity)
    if self.quantity >= quantity
      self.quantity -= quantity
      transactions.create(quantity: quantity, transaction_type: 'remove')
      save
    else
      errors.add(:quantity, "not enough stock available")
    end
  end
end
