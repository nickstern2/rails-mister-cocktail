class DosesController < ApplicationController
  # a dose references a cocktail, an ingredient and has a description.

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.ingredient = @ingredient
    if @dose.save!
      redirect_to cocktail_path(@cocktail.id)
    else
      render "new"
    end
  end

  def destory
    @dose = Dose.find(params[:cocktail_id][:id])
    @dose.destory
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end



























