class DosesController < ApplicationController
  def index         # GET /cocktails
    @dose = Dose.all
  end

  def show          # GET /cocktails/:id
    @dose = Dose.find(params[:id])
  end

  def new           # GET /cocktails/new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = params[:dose][:ingredient]
    @dose = Dose.new(doses_params)
    @dose.ingredient = Ingredient.new(name: @ingredient)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy       # DELETE /cocktails/:id

    @dose = Dose.find(params[:id])
    @dose.destroy
    # no need for app/views/cocktails/destroy.html.erb
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description)
  end
end

