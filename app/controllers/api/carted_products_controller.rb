class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = current_user.current_cart
    render 'index.json.jbuilder'
  end
  
  def create
    @carted_product = CartedProduct.new( 
                                        user_id: current_user.id,
                                        product_id: params[:product_id],
                                        quantity: params[:quantity],
                                        status: "carted"
                                        )

    @carted_product.save
    render 'show.json.jbuilder'
  end

  def destroy
    carted_product_id = params[:id]
    carted_product = CartedProduct.find(carted_product_id)
    carted_product.update(status: "removed")
    
    render json: {message: "Removed item from cart."}
  end
end
