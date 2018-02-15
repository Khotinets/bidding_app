class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end
  
  def auction_all
    @products = Product.joins(:auction)
  end
  
  def without_auction
    @products = Product.all - Product.joins(:auction)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:user_id, :category_id, :name, :description, :minimal_price, :current_price, :auction_status)
    end
end
