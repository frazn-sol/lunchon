ActiveAdmin.register Purchase do
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
