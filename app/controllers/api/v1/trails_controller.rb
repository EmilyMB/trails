class Api::V1::TrailsController < ApplicationController
  def index
    if params[:state]
      @trails = Trail.where(state: params[:state])
    else
      @trails = Trail.limit(30)
    end
    render json: @trails
  end

  def show
    @trail = Trail.find(params[:id])

    render json: @trail
  end

  def search
    if params[:state]
      trails = Trail.filter_by_state(params[:state])
    elsif params[:lat] && params[:lng]
      trails = Trail.filter_by_lat_lng(params[:lat].to_f, params[:lng].to_f)
    end
    render json: trails, each_serializer: TrailSerializer
  end
end
