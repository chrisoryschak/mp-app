ActiveAdmin.register Recipe do
  menu priority: 1

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :cookingTime, :defaultServings, :prepTime, :recipeDescription, :title, recipe_steps_attributes:[:id, :stepInstructions, :stepNumber, :_destroy], quantities_attributes:[:id,:preparation, :primaryamount,:primaryunit, :secondaryamount, :secondaryunit, :ingredient, :fraction, :ingredient_id, :sortOrder, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  controller do
    before_filter :update_fraction, only: [:create, :update]

    private

    def update_fraction
      puts "Running update_fraction method"
      # problem: for each quantity in the param attribrutes, if fraction has a value, update the primary/secondary amount with the amount+fraction
      params[:recipe][:quantities_attributes].each do |k,v|

        case v['fraction']
          when "1/16"
            puts "found 1/16"
            v['primaryamount'] = v['primaryamount'].to_i + 0.0625
          when "1/8"
            v['primaryamount'] = v['primaryamount'].to_i + 0.125
          when "1/4"
            v['primaryamount'] = v['primaryamount'].to_i + 0.25
          when "1/3"
            v['primaryamount'] = v['primaryamount'].to_i + + 0.333
          when "1/2"
            v['primaryamount'] = v['primaryamount'].to_i + 0.5
          when "2/3"
            v['primaryamount'] = v['primaryamount'].to_i + 0.666
          when "3/4"
            v['primaryamount'] = v['primaryamount'].to_i + 0.75
        end

      end
      # update!
    end

  end

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
        if q.preparation?
          text_node "("
          span q.preparation
          text_node ")"
        end
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
      f.input :title, :required => true
      f.input :recipeDescription, label: 'Description', :input_html => { :class => 'autogrow', :rows => 10, :cols => 20}
      f.input :prepTime, :required => true, label: 'Preparation Time (min)'
      f.input :cookingTime, :required => true, label: 'Cooking Time (min)'
      f.input :defaultServings, :required => true, label: 'Default Servings'
    end

    f.has_many :recipe_steps, new_record: 'Add Step', heading: "Steps", sortable: :stepNumber, sortable_start: 1, :allow_destroy => true do |step|
      step.input :stepInstructions, label: "Instructions"
    end

    f.has_many :quantities, new_record: 'Add Ingredient', heading: "Ingredients", sortable: :sortOrder, sortable_start: 1, :allow_destroy => true do |ing|
      ing.input :ingredient, label: "Ingredient"
      ing.input :preparation, label: "Preparation"
      ing.input :primaryamount, label: "Amount"
      ing.input :fraction, label: "Fraction", :as => :select, :collection => ["1/16", "1/8", "1/4", "1/3", "1/2", "2/3","3/4"]
      ing.input :primaryunit , label: "Measurement unit", :as => :select, :collection => ["whole","tsp", "T", "C", "pt", "qt","gal","oz","lb","inch"]
      ing.input :secondaryamount, label: "Secondary amount"
      ing.input :secondaryunit, label: "Secondary measurement unit", :as => :select, :collection => ["teaspoon", "tablespoon", "cup", "pint", "quart","gallon","ounce","pound","inch"]
    end

    f.actions
  end

  end