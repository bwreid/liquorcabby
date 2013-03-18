class CocktailsController < ApplicationController
  before_filter :is_user

  def index
    @cocktails = Cocktail.order(:name)
  end

  def favorites
    @cocktails = @auth.cocktails - @auth.cocktails.where( created_by: @auth.id )
    render :index
  end

  def top_rated
    @cocktails = Cocktail.order(:rank).reverse
    render :index
  end

  def show
    @cocktail = Cocktail.find( params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all.map(&:name).sort
  end

  def create
    @cocktail = Cocktail.new( params[:cocktail] )
    @cocktail.shake_and_save( @auth.id, params[:tags] )
    @cocktails = Cocktail.order(:name)
  end

  def favorite
    cocktail = Cocktail.find( params[:id] )
    if @auth.cocktails.include?(cocktail)
      cocktail.rank -= 1 if cocktail.created_by != @auth.id
      cocktail.save
      @auth.cocktails.delete(cocktail)
    else
      cocktail.rank += 1 if cocktail.created_by != @auth.id
      cocktail.save
      @auth.cocktails << cocktail
    end
    @cocktails = Cocktail.order(:name)
  end
end