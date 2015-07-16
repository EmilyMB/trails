class Api::V1::BirdsController < ApplicationController
  def index
    birds = Species
            .where(trail_id: params[:trail_id], kingdom: "Animalia").has_clip

    render json: birds, each_serializer: BirdsSerializer
  end
end
