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
      panel 'Locations' do
        table_for restaurant.locations do
          column 'Street 1' do |l|
            l.street_1
          end
          column 'Street 2' do |l|
            l.street_2
          end
          column 'City' do |l|
            l.city
          end
          column 'State' do |l|
            l.state
          end
          column 'ZIP' do |l|
            l.zip
          end
          column 'Phone' do |l|
            l.phone
          end
          column 'Hours' do |l|
            l.hours
          end
          column 'Lat' do |l|
            l.latitude
          end
          column 'Long' do |l|
            l.longitude
          end
        end
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.has_many :locations do |l|
        l.inputs  do
          if l.object.persisted?
            l.input :_destroy, as: :boolean, label: 'delete'
          end
          l.input :street_1
          l.input :street_2
          l.input :city
          l.input :state
          l.input :zip
          l.input :phone
          l.input :hours
        end
      end
      f.buttons
    end
  end
  
end
