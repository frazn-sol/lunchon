ActiveAdmin.register Redemption do
  controller do
    def scoped_collection
      Redemption.redeemed
    end
  end
  filter :restaurant_name, as: :select, collection: Restaurant.scoped.order(:name)
  filter :redeemed_at, as: :date_range
  index do |redemption|
    column :id do |redemption|
      link_to redemption.id, admin_redemption_path(redemption)
    end
    column :redeemed_at
    column :purchase do |redemption|
      link_to redemption.purchase.id, admin_purchase_path(redemption.purchase.id)
    end
    column :contract
    column :restaurant do |redemption|
      link_to redemption.restaurant_name, admin_restaurant_path(redemption.restaurant)
    end
    column :deal
    column :original_price do |redemption|
      number_to_currency redemption.original_price, precision: 2
    end
    column :discount do |redemption|
      number_to_percentage redemption.discount_percentage*100, precision: 2
    end
    column :purchase_price do |redemption|
      number_to_currency redemption.purchase_price, precision: 2
    end
  end
  
end
