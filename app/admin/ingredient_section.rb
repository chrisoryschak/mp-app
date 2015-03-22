ActiveAdmin.register IngredientSection do
  belongs_to :recipe
  menu false

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, quantities_attributes:[:id,:_destroy,:preparation, :primaryamount, :primaryunit, :secondaryamount, :secondaryunit, :fraction, :ingredient, :ingredient_section_id, :ingredient_id]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
