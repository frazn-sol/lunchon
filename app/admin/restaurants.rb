ActiveAdmin.register Restaurant do
  menu priority: 3
  show do |restaurant|
    attributes_table do
      row :id
      row :name
      panel 'Contracts' do
        table_for restaurant.contracts do
          column 'Name' do |c|
            link_to c.name, admin_contract_path(c)
          end
          column 'Number of Deals' do |c|
            c.number_of_deals
          end
          column 'Price' do |c|
            c.price
          end
          column 'Total Value' do |c|
            c.value
          end
        end
      end
      row :created_at
      row :updated_at
    end
  end
  
end
