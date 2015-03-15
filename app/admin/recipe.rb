ActiveAdmin.register Recipe do
  menu priority: 1

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :cookingTime, :defaultServings, :prepTime, :recipeDescription, :title, recipe_steps_attributes:[:id, :stepInstructions, :stepNumber, :_destroy], quantities_attributes:[:id,:preparation, :primaryamount,:primaryunit, :secondaryamount, :secondaryunit, :ingredient, :ingredient_id, :sortOrder, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  show do

    div do
      h2 recipe.title
      span recipe.recipeDescription
      br
      br
    end

    div do
      strong "Steps"
      br
      br

      div do
        recipe.recipe_steps.order(:stepNumber).each do |i|
          span b i.stepNumber
          span i.stepInstructions
          br
          br
        end
      end
    end

  end

  sidebar "Ingredients", only: :show do

    div do
      recipe.quantities.order(:sortOrder).each do |q|
        span strong q.primaryamount
        span q.primaryunit
        span q.ingredient.name
        text_node "("
        span q.preparation
        text_node ")"
        br
      end
    end

  end

  sidebar "Details", only: :show do

    attributes_table_for recipe do
      row :defaultServings
      row :prepTime
      row :cookingTime
    end

  end

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
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Details' do
      f.input :title
      f.input :recipeDescription, label: 'Description'
      f.input :prepTime, label: 'Preparation Time (min)'
      f.input :cookingTime, label: 'Cooking Time (min)'
      f.input :defaultServings, label: 'Default Servings'
    end

    f.has_many :recipe_steps, new_record: 'Add Step', heading: "Steps", sortable: :stepNumber, sortable_start: 1, :allow_destroy => true do |step|
      # step.input :stepNumber, label: "Step #"
      step.input :stepInstructions, label: "Instructions"
    end

    f.has_many :quantities, new_record: 'Add Ingredient', heading: "Ingredients", sortable: :sortOrder, sortable_start: 1, :allow_destroy => true do |ing|
      ing.input :ingredient, label: "Ingredient"
      ing.input :preparation, label: "Preparation"
      ing.input :primaryamount, label: "Amount"
      ing.input :primaryunit , label: "Measurement unit", :as => :select, :collection => ["teaspoon", "tablespoon", "cup", "pint", "quart","gallon","ounce","pound","inch"]
      ing.input :secondaryamount, label: "Secondary amount"
      ing.input :secondaryunit, label: "Secondary measurement unit", :as => :select, :collection => ["teaspoon", "tablespoon", "cup", "pint", "quart","gallon","ounce","pound","inch"]
    end

    f.actions
  end

  end