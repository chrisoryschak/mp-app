class RecipeController < ApplicationController
    def index
      @recipes = Recipe.all
      # render json: @recipes, :include => [:recipe_steps, :quantities]
    end
end