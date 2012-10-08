ActiveAdmin.register SubCategory do
  menu :parent => "Site"
  form do |f|
     f.inputs "Details" do
       f.input :name
       f.input :category, :label => "Category*"
       f.input :state, :as => :select, :collection => { "Enable" => 1, "Disable" => 0}, :label => "Status", :include_blank => false
    end
     f.buttons
  end
  
  index do
   column :name
   column :category
    column "User" do |f|
      f.user.name
    end
    column "Status" do |f|
       status_tag (f.state == 0 ? "Disabled" : "Enabled"), (f.state == 0 ? :error : :ok) 
    end
   column "Options" do |fdf|
    links = link_to "Edit", edit_admin_sub_category_path(fdf)
    links += "              "
    links += link_to "Delete", "/admin/sub_categories/"+fdf.id.to_s , :confirm => "Are you sure?", :method=>:delete
    links.html_safe
   end
  end
  
  controller do
      def show
        show! do |format|
          format.html { redirect_to admin_sub_categories_path, :flash => flash }
        end
      end
  end
end
