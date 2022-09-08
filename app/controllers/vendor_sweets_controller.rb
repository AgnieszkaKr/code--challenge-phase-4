class VendorSweetsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        vendorsweet = VendorSweet.create!(permitted_params)
        render json: {id: vendorsweet.id, name: vendorsweet.sweet.name, price: vendorsweet.price }, status: :created
    end

    def destroy
        VendorSweet.find(params[:id]).destroy
        render json: {}
    end

    private
    def permitted_params
        params.permit(:vendor_id, :sweet_id, :price )
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "VendorSweet not found" }, status: :not_found
    end

end

