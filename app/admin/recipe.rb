ActiveAdmin.register Recipe do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :cookingTime, :defaultServings, :prepTime, :recipeDescription, :title, recipe_steps_attributes:[:id, :stepInstructions, :stepNumber, :_destroy], quantities_attributes:[:id,:primaryamount,:primaryunit, :secondaryamount, :secondaryunit, :ingredient, :ingredient_id]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :title
    column :prepTime
    column :cookingTime
    column :defaultServings
    column :created_at
    actions
  end


  form do |f|

    f.inputs 'Details' do
      f.input :title
      f.input :recipeDescription, label: 'Description'
      f.input :prepTime, label: 'Preparation Time (min)'
      f.input :cookingTime, label: 'Cooking Time (min)'
      f.input :defaultServings, label: 'Default Servings'
    end

    f.has_many :recipe_steps, heading: "Steps", :allow_destroy => true do |step|
      step.input :stepInstructions
      step.input :stepNumber
    end

    f.has_many :quantities, heading: "Ingredients", :allow_destroy => true do |ing|
      ing.inputs :primaryamount, :primaryunit, :secondaryamount, :secondaryunit, :ingredient
    end

    # f.has_many :recipe_ingredients, heading: "Ingredients", :allow_destroy => true do |ing|
    #   ing.inputs :preparation, :ingredient, :measurement_unit
    # end

    f.actions
  end

  end