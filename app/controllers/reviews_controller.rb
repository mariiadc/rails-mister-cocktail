class ReviewsController < ApplicationController
  before_action :fetch_cocktail, except: [:destroy]
  def new
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    @review.save
      redirect_to @cocktail

  end

  def destroy
    review = Review.find(params[:id])
      # cocktail = review.cocktail
    review.destroy

      # redirect_to cocktail_path(cocktail)
    redirect_to cocktail_path(review.cocktail)
  end

  private

  def fetch_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
