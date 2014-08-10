ActiveAdmin.register Deal do
  menu priority: 4
  index do |deal|
    column :id
    column :name
    column :restaurant
    column :contract
    column :quantity_purchased
    column :original_price
    default_actions
  end

  show do |deal|
    attributes_table do
      row :id
      row :name
      row :contract_id
      row :restaurant
      row :quantity_purchased
      row :original_price
      row :rating do
        deal.avg_rating
      end
      row :description
      row :image do
        image_tag deal.image_url(:thumb).to_s
      end
      row :image do
        deal[:image]
      end
      row :created_at
      row :updated_at
      panel "Codes" do
        table_for deal.custom_codes do
          column "Code" do |cc|
            cc.code
          end
          column "Used" do |cc|
            cc.consumed
          end
        end
      end
    end
  end

  form do |deal|
    deal.inputs 'Deal' do
      deal.input :contract
      deal.input :name
      deal.input :original_price
      deal.input :quantity_purchased
      deal.input :image, hint: deal.template.image_tag(deal.object.image.url(:thumb) || 'default_deal.png') 
      deal.input :description
      deal.has_many :custom_codes do |cc|
        cc.inputs  do
          cc.input :code
        end
      end       
      deal.buttons
    end
  end

  # controller do
  #     # This code is evaluated within the controller class
  #   def create
  #     binding.pry
  #     if params[:deal][:code].present?
  #       @code = Hash.new()
  #       @code = params[:deal][:code]
  #     end
  #     params[:deal].delete :code
  #     @deal = Deal.new(params[:deal])

  #     respond_to do |format|
  #       if @deal.save
  #         if @code.present?
  #           @code.each  do |code|
  #             @temp = code[1].size
  #             @size = 13 - @temp
  #             CustomCode.create(:code => "0".to_s.rjust(@size, "0") + code[1].to_s, :deal_id => @deal.id)
  #           end
  #         end
  #         format.html { redirect_to admin_deal_path(@deal), notice: 'Deal was successfully created.' }
  #         format.json { render json: @deal, status: :created, location: admin_deal_path(@deal) }
  #       else
  #         format.html { render action: "new" }
  #         format.json { render json: @deal.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   end
  # end
end
