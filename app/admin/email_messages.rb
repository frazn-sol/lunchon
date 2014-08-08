ActiveAdmin.register EmailMessage do
  	form do |f|
      f.inputs "Message" do
        f.input :content, :as => :ckeditor
      end
      f.actions
    end
end
