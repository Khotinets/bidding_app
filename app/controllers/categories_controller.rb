class CategoriesController < ApplicationController
    before_action :authenticate_admin!, :except => [:show, :index]
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @category = Category.all
    end
    
    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
    end
    
    def create
    @category = Category.new(category_params)
        respond_to do |format|
            if @category.save
                format.html { redirect_to @category, notice: 'Category was successfully created.' }
                format.json { render :show, status: :created, location: @category }
            else
                format.html { render :new }
                format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])
        if @category.update_attributes(category_params)
            redirect_to @category
        else
            render 'edit'
        end
    end
    
    def destroy
        @category.destroy
        respond_to do |format|
            format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
    
    private
        def set_category
            @category = Category.find(params[:id])
        end
        def category_params
          params.require(:category).permit(:name, :description)
        end

end