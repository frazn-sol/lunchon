ActiveAdmin.register Contract do
  menu priority: 4
  index do 
    column :id
    column :restaurant
    column :number_of_deals
    column :price
    column :value
    column :total_discount
    column 'Total Discount' do |contract|
      number_to_percentage contract.total_discount*100, precision: 2, strip_insignificant_zeros: true
    end
    default_actions
  end

  show do |contract|
    attributes_table do
      row :id
      row :restaurant_id
      row :price
      row :value
      row :number_of_deals
      panel "Deals" do
        table_for contract.deals do
          column "Name" do |d|
            link_to d.name, admin_deal_path(d)
          end
          column "Original Price" do |d|
            number_to_currency d.original_price
          end
          column 'Contract Quantity' do |d|
            d.quantity_purchased
          end
        end
      end
      panel "Conditions" do
        table_for contract.contract_conditions do
          column do |cc|
            cc.verbage
          end
        end
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :restaurant
      f.input :number_of_deals
      f.input :price
      f.input :value
      f.has_many :contract_conditions do |cc|
        cc.inputs  do
          cc.input :verbage
        end
      end
      f.buttons
    end
  end
  
end
