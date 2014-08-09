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
  
end
