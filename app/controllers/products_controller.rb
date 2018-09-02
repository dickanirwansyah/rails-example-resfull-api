class ProductsController < ApplicationController
  # index method untuk menampilkan semua data product
  def index
    @products = Product.all
  end

  #show method untuk menampilkan data berdasarkan id
  def show
    @product = Product.find(params[:id])
  end

  #new method untuk ke generate ke form product
  def new
    @product = Product.new
  end

  #create method untuk membuat atau create product baru
  def create
    @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "Product added"
        redirect_to root_path
      else
        flash[:error] = "Product failed"
        render: new
      end
  end

  #params
  def product_params
    params.require(:product).permit(:name, :price, :old_price, :short_description, :full_description)
  end

  #edit method untuk edit by id
  def edit
      @product = Product.find(params[:id])
  end

  #update method untuk update execute
  def update
    @product = Product.find(params[:id])
      if @product.update_attributes(product_params)
        flash[:notice] = "Product updated"
        redirect_to root_path
      else
        flash[:error] = "Product failed"
        render: edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
      if @product.delete
        flash[:notice] = "Product delete"
        redirect_to root_path
      else
        flash[:error] = "Product failed"
        render: destroy
  end
end
