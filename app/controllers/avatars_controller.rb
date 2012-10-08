class AvatarsController < ApplicationController
  
  def index
      if current_user
        
      else
          flash[:notice] = "error 403" 
          redirect_to root_url
      end
  end
  
  def getSections
    if params[:id]
      sections = Section.find(:all,:select => 'parent', :group => 'parent', :conditions => ['sections.group = ?', params[:id] ])
    else
      sections = nil
    end
    
    respond_to do |format|
        format.json { render :json => sections}
    end
  end
  
  def getSectionUrl
     if params[:id]
       sections = Section.find(:all, :conditions => ['parent = ?', params[:id] ])
       data = Array.new
       
       sections.each do |d|
         data << { "id" => d.id , "img_front" => d.img_front.url, "img_back" => d.img_back.url, "img_front_thumb" => d.img_front.url(:thumb), "img_back_thumb" => d.img_back.url(:thumb)}
       end
       sections = data
      
      
     else
       sections = nil
     end

     respond_to do |format|
         format.json { render :json => sections}
     end
  end
  
  
end
