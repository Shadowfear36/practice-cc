class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :activity_not_found

    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy!
        head :no_content, status: :ok
    end

    private
    def activity_not_found(error)
        render json: error.message, status: :not_found
    end
end
