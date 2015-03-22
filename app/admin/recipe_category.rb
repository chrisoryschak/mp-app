ActiveAdmin.register RecipeCategory do
menu label: "Categories", priority: 2

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title

  show do
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
