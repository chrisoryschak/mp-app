ActiveAdmin.register Recipe do
  menu priority: 1

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :cookingTime, :defaultServings, :prepTime, :recipeDescription, :title, step_sections_attributes:[:id, :_destroy, :title, recipe_steps_attributes:[:id, :stepInstructions, :stepNumber, :_destroy]], ingredient_sections_attributes:[:id, :_destroy,:title, quantities_attributes:[:id,:_destroy,:preparation, :primaryamount, :primaryunit, :secondaryamount, :secondaryunit, :fraction, :sortOrder, :ingredient, :ingredient_section_id, :ingredient_id]]
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

      params[:recipe][:ingredient_sections_attributes].each do |k,v|
          v[:quantities_attributes].each do |key, val|
             case val['fraction']
              when "1/16"
                val['primaryamount'] = val['primaryamount'].to_i + 0.0625
              when "1/8"
                val['primaryamount'] = val['primaryamount'].to_i + 0.125
              when "1/4"
                val['primaryamount'] = val['primaryamount'].to_i + 0.25
              when "1/3"
                val['primaryamount'] = val['primaryamount'].to_i + 0.333
              when "1/2"
                val['primaryamount'] = val['primaryamount'].to_i + 0.5
              when "2/3"
                val['primaryamount'] = val['primaryamount'].to_i + 0.666
              when "3/4"
                val['primaryamount'] = val['primaryamount'].to_i + 0.75
             end
        end
      end

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

      div do

        h3 "Instructions"

        recipe.step_sections.each do |section|

          span b section.title
          br

          section.recipe_steps.order(:stepNumber).each do |i|
            span b i.stepNumber
            span i.stepInstructions
            br
          end
        end

      end
    end

  end

  sidebar "Ingredients", only: :show do

    div do
      recipe.ingredient_sections.each do |ingsection|

        h4 ingsection.title

        ingsection.quantities.order(:sortOrder).each do |q|
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

    f.has_many :step_sections, new_record: "New Recipe Section", heading: "Instructions", :allow_destroy => true do |section|
      section.input :title, label: "Section heading (can be blank)"

      section.has_many :recipe_steps, new_record: 'Add Step', heading: "Recipe Steps", sortable: :stepNumber, sortable_start: 1, :allow_destroy => true do |step|
        step.input :stepInstructions, label: "Instructions"
      end

    end

    f.has_many :ingredient_sections, new_record: "New Ingredient Section", heading: "Ingredients", :allow_destroy => true do |ingsection|
      ingsection.input :title, label: "Ingredient section heading (can be blank)"

      ingsection.has_many :quantities, new_record: 'Add Ingredient', heading: "Ingredients", sortable: :sortOrder, sortable_start: 1, :allow_destroy => true do |ing|
        ing.input :ingredient, label: "Ingredient"
        ing.input :preparation, label: "Preparation"
        ing.input :primaryamount, label: "Amount"
        ing.input :fraction, label: "Fraction", :as => :select, :collection => ["1/16", "1/8", "1/4", "1/3", "1/2", "2/3","3/4"]
        ing.input :primaryunit , label: "Measurement unit", :as => :select, :collection => ["whole","tsp", "T", "C", "pt", "qt","gal","oz","lb","inch"]
        ing.input :secondaryamount, label: "Secondary amount"
        ing.input :secondaryunit, label: "Secondary measurement unit", :as => :select, :collection => ["teaspoon", "tablespoon", "cup", "pint", "quart","gallon","ounce","pound","inch"]
      end

    end

    f.actions
  end

  end