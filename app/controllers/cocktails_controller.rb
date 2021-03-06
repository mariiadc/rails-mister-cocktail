class CocktailsController < ApplicationController
  def index
    if params[:query].present?
      @cocktails = Cocktail.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cocktails = Cocktail.all
    end

  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render 'cocktails/new'
    end
  end

  def destroy
  @cocktail = Cocktail.find(params[:id])
  @cocktail.destroy
  redirect_to @cocktail
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredient, :dose, :review, :photo)
  end
end
