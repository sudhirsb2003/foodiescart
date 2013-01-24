class LineItemsController < ApplicationController
  skip_before_filter :authorize, :only => :create
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @product = Product.find(params[:product_id])
    @line_item = LineItem.create(params[:line_item])
    @line_item.cart = current_cart
    @line_item.product = @product
    @line_item.quantity = 12
    @line_item.save 
    flash[:notice] = "Added #{@product.ingredient.name} to cart."
    redirect_to current_cart_url
  end

def selected
    @product = Product.find(params[:product_ids])
     @product.each do |p|

 
    @line_item = p.line_items.create(params[:line_item])
    @line_item.cart = current_cart
logger.info"@@@@@@@@@@@@@@"+@line_item.inspect
    @line_item.product = p
    @line_item.quantity = 12
    @line_item.save 
    end
    #flash[:notice] = "Added #{@product.ingredient.name} to cart."
    redirect_to current_cart_url

end



  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :ok }
    end
  end
end
