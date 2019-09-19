class VideosController < ApplicationController
  def index
    @videos = Video.all
    @videos.each do |video|
      seconds = video[:duration] % 60
      minutes = (video[:duration] / 60) % 60
      hours = video[:duration] / (60 * 60)
      video[:nice_duration] = if hours > 0
                                format("%02d:%02d:%02d", hours, minutes, seconds)
                              else
                                format("%02d:%02d", minutes, seconds)
                              end
    end
    @videos
  end

  def show
    @video = Video.get(params[:id])
  end
end
