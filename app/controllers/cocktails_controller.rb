class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @dose = Dose.where(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
       if @cocktail.save
         redirect_to cocktail_path(@cocktail)
       else
         render :index
       end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end