json.recipes @recipes do |recipe|
  json.title recipe.title
  json.description recipe.recipeDescription
  json.preptime recipe.prepTime
  json.cooktime recipe.cookingTime
  json.servings recipe.defaultServings

  json.steps recipe.recipe_steps do |step|
    json.stepnumber step.stepNumber
    json.stepinstructions step.stepInstructions
  end

  json.ingredients recipe.quantities do |ing|
    json.ingredient ing.ingredient.name
    json.preparation ing.preparation
    json.amount ing.primaryamount
    json.unit ing.primaryunit
    json.secondaryamount ing.secondaryamount
    json.secondaryunit ing.secondaryunit
  end

end