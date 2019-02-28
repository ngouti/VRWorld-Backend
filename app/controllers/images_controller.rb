class ImagesController < ApplicationController
    before_action :define_current_image
    skip_before_action :authenticate, only: [ :create, :index ]

    def create
        image = Image.create(image_params)
        image.users << current_user
        render json: image
    end

    def index
        render json: Image.all
        
    end

    def show 
        showimage = Image.all.find(params[:id])
            
        render json: showimage
    end

    def update
        current_image.update(image_params)
        render json: current_image
    end

    def destroy
        current_image.destroy
        render json: current_image
    end

    def define_current_image
        if params[:id]
            @current_image = Image.find(params[:id])
        else
            @current_image = Image.new
        end
    end

    def current_image
        @current_image
    end

    def image_params
        params.require(:image).permit(:img_url, user_ids:[])
    end
end
