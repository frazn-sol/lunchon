ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Active Contracts" do
          Contract.scoped.order(:created_at).each do |contract|
            display_name = "#{contract.restaurant.name} ##{contract.id}"
            columns do
              column do
                span link_to(display_name, admin_contract_path(contract))
              end
              column do
                span "Total Deal Quantity: #{contract.number_of_deals}"
              end
              column do
                span "Total Deals Sold: #{contract.deals_sold_count}"
              end
              column do
                span "Deals Remaining: #{contract.deals_remaining_count}"
              end
            end
          end
        end
      end

       #column do
         #panel "Info" do
           #para "Welcome to ActiveAdmin."
         #end
       #end
     end
  end # content
end
