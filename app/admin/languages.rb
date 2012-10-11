ActiveAdmin.register Language do
    menu :parent => "Site", :priority => 1
    
    form do |f|
       f.inputs "Details" do
         f.input :code
         f.input :name
         f.input :orden
      end
       f.buttons
    end
    
    index do
        column :code
        column :name
        column :orden
        column "Options" do |fdf|
            links = link_to "Edit", edit_admin_language_path(fdf)
            links += " | "
            links += link_to "Delete", admin_languages_path(fdf), :confirm => "Are you sure?", :method=>:delete
            links.html_safe
        end
    end
    
    controller do
        def show
          show! do |format|
            format.html { redirect_to admin_languages_path, :flash => flash }
          end
        end
    end
end
