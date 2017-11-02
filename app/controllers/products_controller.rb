class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    if user_signed_in? && current_user == @product.user && !params.has_key?(:client)
      @attachment = Attachment.new
      render :admin
    end
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = current_user.products.new(product_params)
    #@product.user = current_user
    @product.save
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :pricing, :description, :avatar)
    end
end
