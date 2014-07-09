ActiveAdmin.register User do     
  menu priority: 2
  index do
    column :email
    column :is_merchant
    column :sign_in_count
    default_actions
  end

  filter :email
end
