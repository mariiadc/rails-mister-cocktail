class DosesController < ApplicationController
  # params[:dose] = {"description"=>"2 L", "ingredient_id"=>"104"}
  before_action :fetch_cocktail, except: [:destroy]

  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail # cocktail_path(@cocktail)
    else
      # Always relative do app/views
      # This is rendering app/views/cocktails/show.html.erb
      # Because that's where the form is!
      render 'cocktails/new'
    end
  end

  # DELETE /cocktails/:cocktail_id/doses/:id - if it was nested!
  # DELETE /doses/:id - not nested :)
  def destroy
    dose = Dose.find(params[:id])
    # cocktail = dose.cocktail
    dose.destroy

    # redirect_to cocktail_path(cocktail)
    redirect_to cocktail_path(dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def fetch_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
