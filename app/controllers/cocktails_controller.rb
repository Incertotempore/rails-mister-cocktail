class CocktailsController < ApplicationController
  def index         # GET /cocktails
    @cocktails = Cocktail.all
  end

  def show          # GET /cocktails/:id
    @cocktail = Cocktail.find(params[:id])
  end

  def new           # GET /cocktails/new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit          # GET /cocktails/:id/edit
    @cocktails = Cocktail.find(params[:id])
  end

  def update        # PATCH /cocktails/:id
    @cocktails = Cocktail.find(params[:id])
    @cocktails.update(params[:cocktails])
  end

  def destroy       # DELETE /cocktails/:id
    @cocktails = Cocktail.find(params[:id])
    @cocktails.destroy

    # no need for app/views/cocktails/destroy.html.erb
    redirect_to cocktails_path
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end
