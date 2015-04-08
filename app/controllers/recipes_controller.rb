class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to action: 'new', notice: 'Idea was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :preparations, :image)
    end
end