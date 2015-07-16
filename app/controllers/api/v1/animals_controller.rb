class Api::V1::AnimalsController < ApplicationController
  def index
    animals = Species.where(trail_id: params[:trail_id]).not_bird_animal

    render json: animals, each_serializer: AnimalsSerializer
  end
end
