ActiveAdmin.register Deal do
  show do |deal|
    attributes_table do
      row :id
      row :name
      row :price
      row :rating
      row :created_at
      row :updated_at
      row :image do
        image_tag deal.image_url(:thumb).to_s
      end
      row :image do
        deal[:image]
      end
    end
  end
  
end
