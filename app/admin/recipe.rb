ActiveAdmin.register Recipe do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :cookingTime, :defaultServings, :prepTime, :recipeDescription, :title, recipe_steps_attributes:[:id, :stepInstructions, :stepNumber, :_destroy], quantities_attributes:[:id,:preparation, :primaryamount,:primaryunit, :secondaryamount, :secondaryunit, :ingredient, :ingredient_id, :sortOrder]
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
    f.semantic_errors

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
      ing.input :primaryunit , label: "Measurement unit"
      ing.input :secondaryamount, label: "Secondary amount"
      ing.input :secondaryunit, label: "Secondary measurement unit"
    end

    f.actions
  end

  end