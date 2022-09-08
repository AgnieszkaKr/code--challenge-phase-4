class VendorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        render json: Vendor.all
    end

    def show
        vendor = Vendor.find(params[:id])
        render json: vendor, serializer: VendorVendorSweetsSerializer
    end
    private

    def render_not_found_response
        render json: { error: "Vendor not found" }, status: :not_found
    end
end
