class TimeRequestsController < ApplicationController
  def new
    @session_id = session.id
    @time_request = TimeRequest.new
  end

  def create
    begin
      @time_request = build_time_request(time_request_params, session.id)
      if @time_request && @time_request.save
        flash[:notice] = "Your request has been processed."
        redirect_to time_request_path(@time_request.id)
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

  def build_time_request(params, session_id)
    time_api = TimeAPI.new(params[:latitude], params[:longitude], session_id)
    time_request_params = TimeRequestParams.new(time_api).params
    response_params = ResponseParams.new(time_api.response).params
    location_params = LocationParams.new(time_api.response).params
    time_request = TimeRequest.new(time_request_params)
    time_request.build_response(response_params).build_location(location_params)
    return time_request
  end
end
