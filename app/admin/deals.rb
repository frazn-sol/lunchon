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
      panel "Codes" do
        table_for deal.custom_codes do
          column "Code" do |cc|
            cc.code
          end
          column "Used" do |cc|
            cc.consumed
          end
        end
      end
    end
  end

  form do |deal|
    deal.inputs 'Deal' do
      deal.input :contract
      deal.input :name
      deal.input :original_price
      deal.input :quantity_purchased
      deal.input :image, hint: deal.template.image_tag(deal.object.image.url(:thumb) || 'default_deal.png') 
      deal.input :description
      deal.has_many :custom_codes do |cc|
        cc.inputs  do
          cc.input :code
        end
      end       
      deal.buttons
    end
  end
end
