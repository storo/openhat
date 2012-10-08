ActiveAdmin.register Page do
  menu :parent => "Site"
  form do |f|
    f.inputs "Details" do
       f.input :title
       f.input :content, :input_html => {:class => 'editor'}
    end
     f.buttons
  end
  
  index do
   column :id
   column :title
   column "Options" do |fdf|
    links = link_to "Edit", edit_admin_page_path(fdf)
    links += "              "
    links += link_to "Delete", "/admin/pages/"+fdf.id.to_s , :confirm => "Are you sure?", :method => :delete
    links.html_safe
   end
  end
  
  controller do
      def show
        show! do |format|
          format.html { redirect_to admin_pages_path, :flash => flash }
        end
      end
  end
end
