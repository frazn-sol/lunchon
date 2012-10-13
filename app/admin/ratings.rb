ActiveAdmin.register Rating do
  index do 
    column "Id" do |rating|
      link_to rating.id, admin_rating_path(rating)
    end
    column :rating
    column :deal
    column :created_at
  end
  
end
