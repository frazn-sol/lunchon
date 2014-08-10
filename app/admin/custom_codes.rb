ActiveAdmin.register CustomCode do

  index do
    column :deal
    column :code
    column :consumed
    default_actions
  end

  form do |code|
    code.inputs 'Code' do
      code.input :deal
      code.input :code
    end
    code.buttons
  end

  controller do
  	
  	def create
  	  @temp = params[:custom_code][:code].size
      @size = 13 - @temp
  	  @code = CustomCode.new(params[:custom_code])
  	  @code.code = "0".to_s.rjust(@size, "0") + params[:custom_code][:code].to_s
      respond_to do |format|
        if @code.save
          format.html { redirect_to admin_custom_code_path(@code), notice: 'Code was successfully created.' }
          format.json { render json: @deal, status: :created, location: admin_custom_code_path(@code) }
        else
          format.html { render action: "new" }
          format.json { render json: @deal.errors, status: :unprocessable_entity }
        end
      end
  	end

  end
end
