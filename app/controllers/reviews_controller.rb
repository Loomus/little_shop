class ReviewsController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
  end

  def create
    item = Item.find(params[:item_id])
    review = item.reviews.create(review_params)
    if review.id.nil?
      flash.now[:error] = review.errors.full_messages.to_sentence
      redirect_to "/items/#{item.id}/reviews/#{review.id}/new"
    else
      redirect_to "/items/#{item.id}"
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
     review.update(review_params)
    if review.content.empty? || review.content.empty?
      render :new
    else
      redirect_to "/items/#{review.item_id}"
    end
  end

  def destroy
    Review.destroy(params[:id])
    @item = Item.find(params[:item_id])
    redirect_to "/items/#{@item.id}"
  end

  private

  def review_params
    params.permit(:title, :content, :rating, :item_id)
  end
end
