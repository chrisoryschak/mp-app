ActiveAdmin.register Quantity do
  belongs_to :ingredient_section
  menu false


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :preparation, :primaryamount, :primaryunit, :secondaryamount, :secondaryunit, :ingredient,:fraction, :ingredient_section_id, :ingredient_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

end
