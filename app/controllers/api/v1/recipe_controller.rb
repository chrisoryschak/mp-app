module Api

  module V1

    class RecipeController < ApplicationController
        def index
          @recipes = Recipe.all
        end

    end

  end

end