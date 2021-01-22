ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :category_id, :price, :characteristic, :attachment

   form partial: 'form'

     show do
    attributes_table do
      row :name
      row :category_id
      row :price 
      row :characteristic
      row :attachment do |ad|
        image_tag url_for(ad.attachment)
      end
    end
  end
end
