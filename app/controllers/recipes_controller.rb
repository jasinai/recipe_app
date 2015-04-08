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

  private
    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :preparations, :image)
    end
end