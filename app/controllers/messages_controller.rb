class MessagesController < ApplicationController
  
  def index
      if current_user
          #@messages = Message.find(:all, :conditions => ['messages.recipient = ?', Digest::MD5.hexdigest(current_user.id.to_s)], :group => 'messages.sender', :order => 'id DESC')
          #@messages = Message.where("recipient = '"+ Digest::MD5.hexdigest(current_user.id.to_s)+"'").order('created_at DESC')
          @yarn = YarnParticipant.find(:all, :conditions => ['user_id = ? ', current_user.id])
          render :layout => false
      else
        flash[:notice] = "error 403" 
        redirect_to root_url
      end

  end

  def new

    render :layout => false
  end


  def notification
    if current_user
        nm = MessageReadState.find(:all, :group => 'message_id',  :conditions => ['user_id = ?', current_user.id])
        render :json => nm.to_json
    else
        render :json => 0.to_json
    end
  end

  def read
      if current_user
          @r = Message.find(:all, :conditions => ['yarn_id = ?', params[:id]])
          @yp = YarnParticipant.find(:all, :conditions => ['yarn_id = ?', params[:id]])

          @r.each do |n|
            nm = MessageReadState.find(:first ,  :conditions => ['user_id = ? AND message_id = ?', current_user.id, n.id])
            if !nm.nil?
             # nm.delete
            end
          end




          @id =  params[:id]
          render :layout => false
      else
        flash[:notice] = "error 403" 
        redirect_to root_url
      end
  end
  
  
  def user_ajax
      @users = User.find(:all, :conditions => ['name LIKE ?', "%#{params[:term]}%"])
    
      @userlist = @users.map do |u|
        { :id => u.id, :label => u.name, :value => u.name}
      end
  
      respond_to do |format|
          format.js
          format.json { render :json => @userlist.to_json }
      end
  end
  
  def sendto
    if current_user
      if params[:user]
          u = User.find(:first, :conditions => ['name = ?', params[:user][:recipient]])
          y = Yarn.new
          y.save!

          yp = YarnParticipant.new
          yp.user_id = current_user.id
          yp.yarn_id = y.id
          yp.save!

          yp = YarnParticipant.new
          yp.user_id = u.id
          yp.yarn_id = y.id
          yp.save!

          m = Message.new
          m.body = params[:user][:body]
          m.yarn_id = y.id
          m.user_id = u.id
          m.save!

          mrs = MessageReadState.new
          mrs.user_id = u.id
          mrs.message_id = m.id
          mrs.save!

          redirect_to message_read_url(y.id)

      end
    else
      flash[:notice] = "error 403"
      redirect_to root_url
    end
      
  end

  def send_m
    if current_user
      if params[:user]


        m = Message.new
        m.body = params[:user][:body]
        m.yarn_id = params[:user][:yarn]
        m.user_id = params[:user][:user]
        m.save!

        mrs = MessageReadState.new
        mrs.user_id = params[:user][:user]
        mrs.message_id = m.id
        mrs.save!


      end
      redirect_to message_read_url(params[:user][:yarn])
    else
      flash[:notice] = "error 403"
      redirect_to root_url
    end

  end
end
