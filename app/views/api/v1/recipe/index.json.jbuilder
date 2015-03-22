json.recipes @recipes do |recipe|
  json.title recipe.title
  json.description recipe.recipeDescription
  json.preptime recipe.prepTime
  json.cooktime recipe.cookingTime
  json.servings recipe.defaultServings

  json.steps recipe.step_sections do |step|
    json.sectiontitle step.title

    step.recipe_steps do |recstep|
    json.stepnumber recstep.stepNumber
    json.stepinstructions recstep.stepInstructions
    end

  end

  json.ingredients recipe.ingredient_sections do |ing|
    json.ingsectiontitle ing.title

    ing.quantities do |ingqaunt|
    json.preparation ingqaunt.preparation
    json.amount ingqaunt.primaryamount
    json.unit ingqaunt.primaryunit
    json.secondaryamount ingqaunt.secondaryamount
    json.secondaryunit ingqaunt.secondaryunit
    json.sortorder ingqaunt.sortOrder
    end
  end


end