ActiveAdmin.register Report do
    menu :parent => "Site"
    #scope :active, :default => true do |d|
    #    d.where(:status => 1)
    #end
    #scope :disable do |d|
    #    d.where(:status => 0)
    #end

    #form do |f|
    #  f.inputs "Details" do
    #    f.input :name
    #    f.input :quantity
    #    f.input :price
    #    f.input :status, :as => :select, :collection => { "Active" => true, "Disable" => false}, :label => "Status", :include_blank => false
    #  end
    #  f.buttons
    #end

    index do
      column "Performer" do |f|
         s = Stage.find(:first, :conditions => ['SUBSTR(md5(id),1,11) = ?', f.stage])
         s.user.name
      end
      column "Stage" do |f|
         f.stage
      end
      column "User" do |f|
        u = User.find(:first, :conditions => ['id = ?', f.user_id])
        u.email
      end
      column "Reason" do |f|
        status_tag f.reason, :error
      end
      column "Options" do |fdf|
        #links = link_to "Edit", edit_admin_token_path(fdf)
        #links += "              "
        #links.html_safe
      end
    end




    controller do
      def show
        show! do |format|
          format.html { redirect_to admin_reports_path, :flash => flash }
        end
      end
    end
end
