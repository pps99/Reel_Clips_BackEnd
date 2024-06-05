class ClipsController < ApplicationController
  before_action :set_show_reel
  
  def index
    @clips = @show_reel.clips
    render json: @clips
  end

  def create
    @clip = @show_reel.clips.new(clip_params)
    if @clip.save
      render json: @clip, status: :created
    else
      render json: @clip.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @clip = Clip.find(params[:id])
    @clip.destroy
    @show_reel = @clip.show_reel
    render json: @show_reel.as_json(include: :clips, methods: :total_duration)
  end

  private

  def set_show_reel
    @show_reel = ShowReel.find(params[:show_reel_id])
  end

  def clip_params
    params.require(:clip).permit(:name, :description, :video_standard, :video_definition, :start_timecode, :end_timecode)
  end
end
