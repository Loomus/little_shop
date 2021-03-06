class ItemsController < ApplicationController
  def index
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
      @items = @merchant.items
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @average_review = @item.average_rating
    @top_3 = @item.top_reviews
    @bottom_3 = @item.worst_reviews
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    merchant.items.create(item_params)
    redirect_to "/merchants/#{merchant.id}/items"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:success] = "#{@item.name} has been updated!"
    redirect_to "/items/#{@item.id}"
  else
    flash[:error]= @item.errors.full_messages.to_sentence
    redirect_to  "/items/#{@item.id}/edit"
  end
  end

  def destroy
    Item.destroy(params[:id])
    redirect_to '/items'
  end

  private

  def item_params
    params.permit(:name, :description, :price, :image, :inventory)
  end
end
