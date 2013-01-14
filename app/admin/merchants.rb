ActiveAdmin.register Merchant do
  controller do
    def scoped_collection
      Merchant.where(is_merchant: true)
    end
  end

  index do                            
    column :email                     
    column "Restaurants" do |merchant|
      merchant.restaurants.map{ |r| link_to r.name, admin_restaurant_path(r.id) }.join(", ").html_safe
    end
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :email                       

  show do |merchant|
    attributes_table do
      row :id
      row :email
      row 'Restaurants' do 
        merchant.restaurants.map{ |r| link_to r.name, admin_restaurant_path(r.id) }.join(", ").html_safe
      end
      row :current_sign_in_at        
      row :last_sign_in_at           
      row :sign_in_count             
    end
  end
  
  form do |f|                         
    f.inputs "Merchant User Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
      f.input :restaurants
    end                               
    f.buttons                         
  end                                 
end
