class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else 
            render json: @cat.errors.full_messages, status: 422
        end
    end

    def update

    end

    def edit
        @cat_colors = Cat::CAT_COLORS
        @cat = Cat.find(params[:id])
        render :edit
    end

    def new
        @cat_colors = Cat::CAT_COLORS
        @cat = Cat.new
        render :new
    end

    private

    def cat_params
        params.require(:cat).permit(:birth_date, :name, :sex, :color)
    end
end
