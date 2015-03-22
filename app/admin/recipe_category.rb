ActiveAdmin.register RecipeCategory do
menu label: "Categories", priority: 2

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title

index do
  selectable_column
  column :id
  column :title
  column "Recipes" do |recipe_category|
    recipe_category.recipes.count
  end
  column :created_at
  column :updated_at
  actions
end

  show do
    @recipes = recipe_category.recipes
     if @recipes.count > 0
      panel "Related Recipes" do

        table_for recipe_category.recipes do
          column :title do |recipe|
            link_to recipe.title, admin_recipe_path(recipe.id)
          end
          column :recipeDescription
          column :credit
        end

      end
    end


  end


end
