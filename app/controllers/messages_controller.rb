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


  def read
      if current_user
          r = Message.find(:first, :conditions => ['md5(id) = ?', params[:id]])
          @sender = User.find(r.sender)
          @recipient = User.find(:first, :conditions => ['md5(id) = ?', r.recipient])
          
          @messages = Message.find(:all, :conditions => ['(sender = ? AND recipient = ?) OR (sender = ? AND recipient = ?)',r.sender, Digest::MD5.hexdigest(current_user.id.to_s),current_user.id, Digest::MD5.hexdigest(r.sender.to_s)])
          render :layout => false
      else
        flash[:notice] = "error 403" 
        redirect_to root_url
      end
  end
  
  
  def user_ajax
      @users = User.find(:all, :conditions => ['email LIKE ?', "%#{params[:term]}%"])
    
      @userlist = @users.map do |u|
        { :id => u.id, :label => u.email, :value => u.email}
      end
  
      respond_to do |format|
          format.js
          format.json { render :json => @userlist.to_json }
      end
  end
  
  def sendto
    if current_user
      if params[:user]
          u = User.find(:first, :conditions => ['email = ?', params[:user][:recipient]])
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
          mrs.user_id = current_user.id
          mrs.message_id = m.id
          mrs.save!

          flash[:notice] = "Message send!" 
      end
      redirect_to messages_url
    else
      flash[:notice] = "error 403"
      redirect_to root_url
    end
      
  end
end
