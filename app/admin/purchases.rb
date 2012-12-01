ActiveAdmin.register Purchase do
  menu priority: 5
  index do 
    column :id
    column :user_id do |purchase|
      purchase.user.email
    end
    column :price do |purchase|
      number_to_currency purchase.price
    end
    column 'Purchased On', :created_at
    column 'Discount' do |purchase|
      number_to_percentage purchase.discount_percentage*100, precision: 2, strip_insignificant_zeros: true
    end
    default_actions
  end

  show do |purchase|
    attributes_table do
      row :id
      row :created_at
      row :user_id do
        purchase.user.email
      end

      panel 'Items' do
        table_for purchase.purchase_items do 
          column "name" do |item|
             item.deal_name
          end
          column "deal id" do |item|
             link_to item.deal_id, admin_deal_path(deal_id:item.deal_id)
          end
          column "redemption code" do |item|
            item.redemption_code
          end
          column "redeemed at" do |item|
            item.redeemed_at
          end
        end
      end
    end
  end
  
end
