class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :camper_invalid
    def index
        campers = Camper.all
        render json: campers.to_json(:except => [:activities]), status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, status: :ok
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_not_found(error)
        render json: error.message, status: :not_found
    end

    def camper_invalid(error)
        render json: error.message, status: 422
    end

    def camper_params
        params.permit(:name, :age)
    end
end
