# app/models/transaction.rb
class Transaction < ApplicationRecord
  belongs_to :stock_item
end