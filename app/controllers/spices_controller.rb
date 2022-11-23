class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_spice_not_found

    def index
        render json: Spice.all
    end

    def create
        render json: Spice.create(spices_params), status: 201
    end

    def update
        render json: Spice.update(params[:id], spices_params)
    end

    def destroy
        spice = find_spice(params)
        spice.destroy
    end

private
    def spices_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

def find_spice(params)
    Spice.find(params[:id])
    end

    def render_spice_not_found
        render json: {error: "spice not found!"}, status: 404
    end
end
