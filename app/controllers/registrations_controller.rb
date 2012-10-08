class RegistrationsController < Devise::RegistrationsController

  def create  
    super  
    session[:omniauth] = nil unless @user.new_record?   
  end
  
  def new
    super
  end
  
  def update
    super
  end
  
  protected

    def after_sign_up_path_for(resource)
      #redirect_to root_path
      '/login'
    end
    
    private  
    def build_resource(*args)  
      super  
      if session[:omniauth]  
        @user.apply_omniauth(session[:omniauth])  
        @user.valid?

      end  
    end
end
