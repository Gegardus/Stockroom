# app/models/product.rb
class Product < ApplicationRecord
has_many :stock_items
end
