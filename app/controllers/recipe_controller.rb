class RecipeController < ApplicationController
    def index
      @recipes = Recipe.all
      render json: @recipes
    end
end