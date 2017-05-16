class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  # GET /products
  # GET /products.json
  def index
    Product.retrieve_feed
    @products = Product.all
    @order_item = current_order.order_items.new
    @order = Order.new
  end

  # GET /products/1
  # GET /products/1.json
  def show
    if @product.description.scan(/\[LIST\]/)
      list = @product.description.gsub(/\[LIST\]/, '').split('[*]')
      @desc = list.shift
      @list = list.map {|item| item.gsub(/\*(.*)\*/, '\1')} # removing '*' from XML for bolding
    end
    @order_item = current_order.order_items.new
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  # not being used
  def edit
  end

  # POST /products
  # POST /products.json
  # not being used
  def create
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  # not being used
  def update
  end

  # DELETE /products/1
  # DELETE /products/1.json
  # not being used but will be needed when product expiration is implemented
  def destroy
    # @product.destroy
    # respond_to do |format|
    #   format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :link)
    end
end
