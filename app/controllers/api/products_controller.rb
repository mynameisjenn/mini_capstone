class Api::ProductsController < ApplicationController
  # before_action :authenticate_admin, only: [:create, :update, :destroy]

  def index
    @products = Product.all 
    search_term = params[:search]

    if search_term
      @products = @products.where("name iLIKE ? OR description iLIKE ?", "%#{search_term}%", "%#{search_term}%" )
    end

    sort_attribute = params[:sort_by]
    sort_order = params[:sort_order]

    if sort_attribute && sort_order
      @products = @products.order(sort_attribute => sort_order)
    elsif sort_attribute 
      @products = @products.order(sort_attribute => :asc)
    else
      @products = @products.order(:id => :asc)
    end

    category_name = params[:category]
      if category_name
        category = Category.find_by(name: category_name)
        @products = category.products
      end
      render 'index.json.jbuilder'
  end

  def show
    product_id = params[:id]
    @product = Product.find(product_id)
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
                          name: params[:name],
                          price: params[:price],
                          description: params[:description],
                          supplier_id: params[:supplier_id]
                          )

    if @product.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @products.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def update
    product_id = params[:id]
    @product = Product.find(product_id)

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id

    if @product.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.destroy
    render json: {message: "Product successfully destroyed."} 
  end
end
