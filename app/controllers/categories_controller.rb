class CategoriesController < ApplicationController
    
    def index
        @category = Category.all
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to @category, notice: 'Category was successfully created.'
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def show
        @category = Category.find(params[:id])
    end
    private
    
        def category_params
          params.require(:category).permit(:name, :description)
        end

end