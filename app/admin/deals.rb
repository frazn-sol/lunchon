ActiveAdmin.register Deal do
  show do |deal|
    attributes_table do
      row :id
      row :name
      row :restaurant_id
      row :price
      row :original_price
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

  form do |deal|
    deal.inputs 'Deal' do
      deal.input :restaurant
      deal.input :name
      deal.input :price
      deal.input :original_price
      deal.input :image
      deal.input :description
    end
    deal.buttons
  end
end
