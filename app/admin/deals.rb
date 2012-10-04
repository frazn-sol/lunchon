ActiveAdmin.register Deal do
  show do |deal|
    attributes_table do
      row :id
      row :name
      row :restaurant_id
      row :price
      row :rating
      row :description
      row :image do
        image_tag deal.image_url(:thumb).to_s
      end
      row :image do
        deal[:image]
      end
      row :created_at
      row :updated_at
    end
  end
end
