class ProductsController < ApplicationController
  def index
  end

  def new
    render(ComponentNameComponent.new(title: "my title").with_content("Now i will replace with content"))
  end

  def show
  end

  def add_stock
    @product = Product.find(params[:id])
    stock_item = @product.stock_items.first_or_create(location: 'warehouse') # Simplified for example
    stock_item.add_stock(params[:quantity].to_i)

    if stock_item.errors.any?
      render json: { errors: stock_item.errors.full_messages }, status: :unprocessable_entity
    else
      render json: @product, status: :ok
    end
  end

  def remove_stock
    @product = Product.find(params[:id])
    stock_item = @product.stock_items.first

    if stock_item
      stock_item.remove_stock(params[:quantity].to_i)
      if stock_item.errors.any?
        render json: { errors: stock_item.errors.full_messages }, status: :unprocessable_entity
      else
        render json: @product, status: :ok
      end
    else
      render json: { error: "Stock item not found" }, status: :not_found
    end
  end
end
