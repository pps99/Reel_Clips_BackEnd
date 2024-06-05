# app/controllers/show_reels_controller.rb
class ShowReelsController < ApplicationController
    def index
      @show_reels = ShowReel.all
      render json: @show_reels.as_json(include: :clips, methods: :total_duration)
    end
  
    def create
      @show_reel = ShowReel.new(show_reel_params)
      if @show_reel.save
        render json: @show_reel, status: :created
      else
        render json: @show_reel.errors, status: :unprocessable_entity
      end
    end
  
    def show
      @show_reel = ShowReel.find(params[:id])
      render json: @show_reel.as_json(include: :clips, methods: :total_duration)
    end
  
    def update
      @show_reel = ShowReel.find(params[:id])
      if @show_reel.update(show_reel_params)
        render json: @show_reel
      else
        render json: @show_reel.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @show_reel = ShowReel.find(params[:id])
      @show_reel.destroy
      head :no_content
    end
  
    private
  
    def show_reel_params
      params.require(:show_reel).permit(:name, :video_standard, :video_definition)
    end
end
  