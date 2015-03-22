json.recipes @recipes do |recipe|
  json.title recipe.title
  json.description recipe.recipeDescription
  json.preptime recipe.prepTime
  json.cooktime recipe.cookingTime
  json.servings recipe.defaultServings

  json.recipesections recipe.step_sections do |step|
    json.sectiontitle step.title

    json.steps step.recipe_steps do |recipestep|
      json.stepnumber  recipestep.stepNumber
      json.instructions recipestep.stepInstructions
    end

  end

  json.ingredients recipe.ingredient_sections do |ing|
    json.ingsectiontitle ing.title

    json.ingredients ing.quantities do |ingqaunt|
      json.ingredient ingqaunt.ingredient.name
      json.amount ingqaunt.primaryamount
      json.unit ingqaunt.primaryunit
      json.preparation ingqaunt.preparation
      json.secondaryamount ingqaunt.secondaryamount
      json.secondaryunit ingqaunt.secondaryunit
      json.sortorder ingqaunt.sortOrder
    end
  end


end