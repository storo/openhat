ActiveAdmin.register Category do
  menu :parent => "Site"
  form do |f|
     f.inputs "Details" do
       f.input :name
       f.input :state, :as => :select, :collection => { "Enable" => 1, "Disable" => 0}, :label => "Status", :include_blank => false
    end
     f.buttons
  end
  
  index do
   column :name
   column :state
   column "Options" do |p|
    links = link_to "Edit", edit_admin_category_path(p)
    links += "              "
    links += link_to "Delete", "/admin/categories/"+p.id.to_s , :confirm => "Are you sure?", :method => :delete
    links.html_safe
   end
  end
   
  controller do
      def show
        show! do |format|
          format.html { redirect_to admin_categories_path, :flash => flash }
        end
      end
  end
  
end