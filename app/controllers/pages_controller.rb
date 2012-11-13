class PagesController < ApplicationController
  def page
    # metodo page
    # recive  como parametro  :page, que es el nombre de la page en lowercase y remplazando los espacio por _
    if params[:page]  # SI existe el parametro :page
       # Asignar la busqueda del page en su modelo pasando el params[:page]  a @page
       @page = Page.find(:first, :conditions => ['REPLACE(LOWER(title), " ", "_") = ?', params[:page]])
       @performance_random = Stage.find(:all, :limit => 5, :order => 'rand()', :conditions =>['delete_status = 0'])
       # @page: Variable Global, que contiene la busqueda Hecha en Page
       # Page: Modelo para la tabla pages
       # params[:page]: Variable local (privada), enviada por medio del url
    end
  end

  def modal
    if params[:page]  # SI existe el parametro :page
                      # Asignar la busqueda del page en su modelo pasando el params[:page]  a @page
      @page = Page.find(:first, :conditions => ['REPLACE(LOWER(title), " ", "_") = ?', params[:page]])
     end
    render :layout => false
  end

  def contact
      p = Contact.new
      p.name = params[:contact][:name]
      p.email = params[:contact][:email]
      p.rate = params[:contact][:rate]
      p.subject = params[:contact][:subject]
      p.message = params[:contact][:message]
      p.save!

      session[:save] =  'Your information was successfully submitted'
      redirect_to root_url

  end


end
