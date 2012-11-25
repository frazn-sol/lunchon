ActiveAdmin.register Contract do
  index do |contract|
    column :id
    column :restaurant
    column :number_of_deals
    column :price
    column :value
    default_actions
  end

  show do |contract|
    attributes_table do
      row :id
      row :restaurant_id
      row :price
      row :value
      row :number_of_deals
      row :created_at
      row :updated_at
    end
  end
  
end
