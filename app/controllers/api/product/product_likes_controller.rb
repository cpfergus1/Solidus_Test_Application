module Api
  class ProductLikesController < Spree::Api::BaseController
    def create
      @product = find_product(params[:product_id])
      @like = ProductLike.new(product: @product, user: current_api_user)

      if @like.save
        render :show, status: :created
      else
        invalid_resource!(@like)
      end
    end
  end
end
