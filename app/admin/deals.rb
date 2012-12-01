ActiveAdmin.register Deal do
  menu priority: 4
  index do |deal|
    column :id
    column :name
    column :restaurant
    column :contract
    column :quantity_purchased
    column :original_price
    default_actions
  end

  show do |deal|
    attributes_table do
      row :id
      row :name
      row :contract_id
      row :restaurant
      row :quantity_purchased
      row :original_price
      row :rating do
        deal.avg_rating
      end
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
      deal.input :contract_id
      deal.input :name
      deal.input :original_price
      deal.input :quantity_purchased
      deal.input :image, hint: deal.template.image_tag(deal.object.image.url(:thumb)) 
      deal.input :description
    end
    deal.buttons
  end
end
