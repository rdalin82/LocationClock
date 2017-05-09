class TimeRequestsController < ApplicationController
  def new
    @session_id = session.id
    @time_request = TimeRequest.new
  end

  def create
    begin
      time_service = TimeRequestAPI.new(time_request_params[:latitude], time_request_params[:longitude], session.id)
      params = time_service.params
      @time_request = TimeRequest.new(params)
      if @time_request && @time_request.save
        flash[:notice] = "Your request has been processed."
        redirect_to @time_request
      else
        flash.now[:alert] = "There was an error with your request.\n #{@time_request.errors.full_messages.join("\n ")}"
        @time_request = TimeRequest.new
        render :new
      end
    rescue Exception => e
      flash[:alert] = "There was an error with your request. #{e.message}"
      redirect_to root_path
    end
  end

  def show
    @time_request = TimeRequest.find(params[:id])
  end

  private

  def time_request_params
    params.require(:time_request).permit(:latitude, :longitude, session.id)
  end
end
