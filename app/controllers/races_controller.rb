class RacesController < ApplicationController

  def new
    @race = Race.new
  end

  def create
    redirect_to race_path(Race.start(params.require(:race).permit(:distance)).id)
  rescue => e
    Rails.logger.error e.message
    Rails.logger.error e.backtrace.join("\n\t")

    flash[:error] = "Unable to start race: #{e.message}"
    redirect_to new_race_path
  end

  def show
    @race = Race.find(params[:id])
  end

  def run
    @race = Race.find(params[:race_id])
    render json: @race
  end
end
