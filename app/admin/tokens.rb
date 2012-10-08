ActiveAdmin.register Token do
    menu :parent => "Site"
    scope :active, :default => true do |d|
        d.where(:status => 1)
    end
    scope :disable do |d|
        d.where(:status => 0)
    end
    
    form do |f|
       f.inputs "Details" do
         f.input :name
         f.input :quantity
         f.input :price
         f.input :status, :as => :select, :collection => { "Active" => true, "Disable" => false}, :label => "Status", :include_blank => false
      end
       f.buttons
    end
    
    index do
      column :name
      column :quantity
      column :price
      column "Status" do |f|
         status_tag (f.status == false ? "Disable" : "Active"), (f.status == false ? :error : :ok) 
      end
      column "Options" do |fdf|
          links = link_to "Edit", edit_admin_token_path(fdf)
          links += "              "  
          links.html_safe
     end
    end
    
    
    
    
    controller do
         def show
           show! do |format|
             format.html { redirect_to admin_tokens_path, :flash => flash }
           end
         end 
    end
end
