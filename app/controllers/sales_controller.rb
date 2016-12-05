class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :find_selector_customers, only: [:edit, :new]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @customers = find_selector_customers
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    @sale.seller = Seller.first

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def choose_products
    print 'test'
    @sale_product = SaleProduct.new

    print @sale

    @sale_products = SaleProduct.where(:sale_id => @sale.id)
    @available_products = Procuts.where("product_id NOT IN ?", @sale_products.map(&:product_id))
  end

  def add_product
    product = Product.where(:id => params[:product_id])

    store = Store.new
    store.quantity = params[:quantity]
    store.isSale = true
    store.product = product
    store.movementDate = Time.now
    store.save

    @sale_product.product = product
    @sale_product.price = product.price
    @sale_product.sale = @sale
    @sale_product.store = store

    @sale_product.save
  end

  def remove_product
    product_id = params[:product_id]
    @sale_products.each do |i|
      if(i.product.id == product_id) then
        i.destroy
      end
    end
  end

  def finish_sale
    redirect_to "show"
  end 

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def find_selector_customers
      @selector_customers = Customer.order(:name).collect {|customer| [ customer.name, customer.id ]}
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:seller_id, :customer_id, :saleDate)
    end
end
