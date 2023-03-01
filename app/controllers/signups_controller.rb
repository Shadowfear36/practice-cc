class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :signup_invalid
    
    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def signup_invalid(error)
        render json: error.message, status: 422
    end
end
