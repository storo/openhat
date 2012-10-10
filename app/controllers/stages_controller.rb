class StagesController < ApplicationController
  
  def index
      if current_user
          if params[:id]
            @stage = Stage.find(:first, :conditions => ['SUBSTR(md5(id),1,11) = ?', params[:id]])
            @id = params[:id]
            @performance = Stage.find(:all, :limit => 3, :order => 'id DESC', :conditions =>['delete_status  = 0'])
            @tippers = Tip.find(:all, :conditions => ['stage_id = ?', @id], :group => 'sender', :limit => 4, :order => 'SUM(tokens) DESC', :select => 'sender, SUM(tokens) as tokens')
            @character = Character.find(:all, :conditions => ['user_id = ?', current_user.id])

          else
            flash[:notice] = "error 403"
            redirect_to root_url
          end
      else
          session[:error] = 'You must <a href="/login">login</a> or <a href="/register">register</a> to see this performance.'
          redirect_to root_url
      end
  end
  
  
  def makeStage
      if current_user

      else
          flash[:notice] = "error 403"
          redirect_to root_url
      end
    
  end

  def create
    if current_user
      if params[:stage]
        @stage = Stage.new
        @stage.types = params[:stage][:type]
        @stage.room_name = params[:stage][:room_name]
        @stage.category_id = params[:stage][:category_id]
        #@stage.sub_category_id = params[:stage][:sub_category_id]
        @stage.language_content = params[:stage][:language_content]
        @stage.rate = params[:stage][:rate]
        @stage.user_id = current_user.id
        @stage.ticket_type = params[:stage][:type_ticket]

        @stage.ticket_price = params[:stage][:ticket_price]
        @stage.limited_seats = params[:stage][:limit_seats]
        @stage.image = params[:stage][:performance_image]
        @stage.design = params[:stage][:design]
        @stage.delete_status = 0
        if params[:stage][:shownow] == "yes"
            @stage.live = DateTime.now
            @stage.status = 'online'
        else

            @stage.live =  DateTime.civil(params[:stage]['live(1i)'].to_i,params[:stage]['live(2i)'].to_i,params[:stage]['live(3i)'].to_i,params[:stage]['live(4i)'].to_i,params[:stage]['live(5i)'].to_i)
            @stage.status = 'offline'
        end


        @stage.design = params[:stage][:design]


        if @stage.save!
          flash[:notice] = "Stage Save!"
          if params[:stage][:shownow] == 'yes'
              redirect_to stage_path(Digest::MD5.hexdigest(@stage.id.to_s)[0,11])
          else
              redirect_to root_url
          end
          #redirect_to create_performance_url
        end
      end
    else
      flash[:notice] = "error 403"
      redirect_to root_url
    end
  end

  def report

    render :layout => false
  end

  def configuration
    @id = params[:id]
    @stage = Stage.find(:first, :conditions => ['SUBSTR(md5(id),1,11) = ?', params[:id]])
    render :layout => false
  end

  def tippers
    @id = params[:id]
    @tippers = Tip.find(:all,:select => 'SUM(tokens) as token, sender', :group => 'sender' , :order => 'token DESC', :conditions => ['stage_id = ?', params[:id]])

    render :layout => false
  end

  def totaltips
    @tippers = Tip.find(:first,:select => 'SUM(tokens) as token', :conditions => ['stage_id = ?', params[:id]])
     render :text => @tippers.token.to_s
  end

  def saveconfiguration
    @stage = Stage.find(:first, :conditions => ['SUBSTR(md5(id),1,11) = ?', params[:id]])
    @stage.design = params[:option]

    @stage.save!
    render :text => 'save configurarion'
  end
  def close

    if params[:id]
      @stage = Stage.find(:first, :conditions => ['SUBSTR(md5(id),1,11) = ?', params[:id]])
      @stage.delete_status = 1
      if @stage.save!
        session[:error]  = 'Stage Close'
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end
end
