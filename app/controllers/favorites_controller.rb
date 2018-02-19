class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite, only: [:show, :destroy]
  respond_to :js, :json, :html
  # GET /favorites
  # GET /favorites.json
  def index
    #Find all products by favorites created by current  user
    @products = Product.joins(favorites: :user).where(favorites: {user_id: current_user.id})
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = Favorite.new(favorite_params)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def clear_favorites
    @user = current_user
    @favorites = @user.favorites.all
    @favorites.each do |favorite|
      favorite.destroy
    end
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorites was successfully destroyed.' }
    end
  end
  
  def favorite
    @user = current_user
    @product = Product.find(params[:product_id])
    @user.favorite!(@product)
    respond_to do |format|
     format.js
    end
  end

  def unfavorite
    @user = current_user
    @favorite = @user.favorites.find_by_product_id(params[:product_id])
    @product = Product.find(params[:product_id])
    @favorite.destroy!
    respond_to do |format|
     format.js
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:user, :product)
    end
end
