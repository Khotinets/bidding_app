class AuctionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_auction, only: [:show, :destroy]

  # GET /auctions
  # GET /auctions.json
  def index
    @auctions = Auction.all
  end

  # GET /auctions/1
  # GET /auctions/1.json
  def show
  end

  # GET /auctions/new
  def new
    @auction = Auction.new
  end
  
  # POST /auctions
  # POST /auctions.json
  def create
    @auction = Auction.new(auction_params)
    if current_user.id == @auction.product.user_id
      respond_to do |format|
        if @auction.save
          format.html { redirect_to @auction.product, notice: 'Auction was successfully created.' }
          format.json { render :show, status: :created, location: @auction }
        else
          format.html { render :new }
          format.json { render json: @auction.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to products_path, notice: 'You are not the owner of the product'
    end
  end

  # DELETE /auctions/1
  # DELETE /auctions/1.json
  def destroy
    if current_user.id == @auction.product.user_id
      @auction.destroy 
      respond_to do |format|
        format.html { redirect_to user_products_path(current_user), notice: 'Auction was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to products_path, notice: 'You are not the owner of the product'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:product_id, :user_id, :starts_at, :ends_at)
    end
end
