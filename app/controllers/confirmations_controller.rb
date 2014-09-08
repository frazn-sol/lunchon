class ConfirmationsController < Devise::ConfirmationsController
  protected
    def after_confirmation_path_for(resource_name, resource)
      if !resource.is_merchant?
      	how_it_works_path
      else
        root_path
      end
    end
end