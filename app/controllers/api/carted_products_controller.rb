class Api::CartedProductsController < ApplicationController

  def index
    if user_id == current_user.id 
      @carted_product = CartedProduct.where(status: "carted")
      end
      render = 'index.json.jbuilder'
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
end
