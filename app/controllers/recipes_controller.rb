class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Idea was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update_attributes(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @recipe.destroy
    redirect_to action: 'new', notice: 'Idea was successfully deleted.'
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :preparations, :image)
    end
  
    def find_recipe
      @recipe = Recipe.find(params[:id])
    end
end