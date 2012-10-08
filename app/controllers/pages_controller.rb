class PagesController < ApplicationController
  def page
    # metodo page
    # recive  como parametro  :page, que es el nombre de la page en lowercase y remplazando los espacio por _
    if params[:page]  # SI existe el parametro :page
       # Asignar la busqueda del page en su modelo pasando el params[:page]  a @page
       @page = Page.find(:first, :conditions => ['REPLACE(LOWER(title), " ", "_") = ?', params[:page]])
       # @page: Variable Global, que contiene la busqueda Hecha en Page
       # Page: Modelo para la tabla pages
       # params[:page]: Variable local (privada), enviada por medio del url
    end
  end


end
