module Api

  module V1

    class IngredientsController < ApplicationController

      def index
        @ingredients = Ingredient.all
      end

    end

  end

end