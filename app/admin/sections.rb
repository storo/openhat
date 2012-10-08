ActiveAdmin.register Section do
  config.clear_sidebar_sections!
  menu :label => "Avatar Sections"
  
  scope :all, :default => true
  scope :heads do |s|
    s.where(:parent => "Head")
  end
  scope :eyes do |s|
    s.where(:parent => "Eyes")
  end
  scope :nose do |s|
    s.where(:parent => "Nose")
  end
  scope :mouth do |s|
    s.where(:parent => "Mouth")
  end
  scope :trunk do |s|
    s.where(:parent => "Trunk")
  end
  
  
  index :as => :grid, :columns => 8 do |p|
      todo = "<div class='box-sections'>"
      todo += link_to(image_tag(p.img_front.url(:thumb)), edit_admin_section_path(p))   
      todo += "</div>"
      todo += "<div class='box-links'>"
      todo += link_to "Delete", admin_section_path(p), :confirm => "Are you sure?", :method => :delete
       todo += "</div>"
      todo.html_safe
  end
  
  
  form :html => { :multipart => true} do |f|
    f.inputs "Details" do
      f.input :name
      f.input :parent, :as => :select, :collection => ["Head", "Nose", "Eyes", "Mouth", "Trunk"], :label => "Part of the body"
      f.input :img_front, :as => :file, :label => "Front Image", :hint => ( f.object.new_record? || f.object.img_front.nil? ) ? f.template.content_tag(:span, "no photo yet") : f.template.image_tag(f.object.img_front.url(:thumb))
      f.input :img_back, :as => :file, :label => "Back Image", :hint => ( f.object.new_record? || f.object.img_back.nil? ) ? f.template.content_tag(:span, "no photo yet") : f.template.image_tag(f.object.img_back.url(:thumb))
      f.input :gender, :as => :select, :collection => ["Both", "Female", "Male"]
      f.input :group, :as => :select, :collection => ["Head", "Body", "Extra"]
      f.input :free, :input_html => { :checked => 'checked' }
    end
    f.buttons
  end
  
  
  controller do
      def show
        show! do |format|
          format.html { redirect_to admin_sections_path, :flash => flash }
        end
      end
  end
  
  
  
end
