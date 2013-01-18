#require 'ostruct'
#require 'money'
#require 'active_merchant'
#require 'active_merchant/billing/integrations/action_view_helper'
class HomeController < ApplicationController
  #include ActiveMerchant::Billing::Integrations
  #ActionView::Base.send(:include,ActiveMerchant::Billing::Integrations::ActionViewHelper)
    def index

        fuu = Stage.find(:all, :conditions => ['delete_status = 0'])
        fuu.each do |ohhfuck|
          t = ohhfuck.updated_at + 20.minutes
          if t <= DateTime.now
            ohhfuck.delete_status = 1
            ohhfuck.save!
          end
        end


        @last_users = User.find(:all, :conditions => ['sign_in_count > 0'], :order => 'created_at DESC')
        @performance = Stage.find(:all, :limit => 3, :order => 'id DESC', :conditions =>['delete_status = 0'])
        @performance_random = Stage.find(:all, :limit => 5, :order => 'rand()', :conditions =>['delete_status = 0'])
    end
    
    def profile
      if current_user
          @followers = Follower.find(:all, :conditions => ['leader = ?', Digest::MD5.hexdigest(current_user.id.to_s)])
          #@activities = Activity.find(:all, :conditions => ['user_id = ?', current_user.id])
          @avatar = Avatar.find(:first, :conditions => ['user_id = ?', current_user.id ])
          @stage = Stage.find(:first, :conditions => ['user_id = ? AND status = "enabled"', current_user.id])
          @character = Character.find(:all, :conditions => ['user_id = ?', current_user])

          tokens = MyToken.find(:all, :conditions => ['user_id = ?',current_user.id])
          @t = 0
          tokens.each do |d|
            if d.operation.nil?
              @t += d.amount.to_i
            else
              @t -= d.amount.to_i
            end
          end

      else
        flash[:notice] = "error 403" 
        redirect_to root_url
      end 
    end
    
    def public_profile
        if current_user 
          if Digest::MD5.hexdigest(current_user.id.to_s) == params[:id]
            redirect_to profile_url
          end
        else
         
        end   
        @user = User.find(:first, :conditions =>['MD5(id) = ?', params[:id]])
        @followers = Follower.find(:all, :conditions => ['leader = ?', params[:id]])
        @activities = Activity.find(:all, :conditions => ['md5(user_id) = ?', params[:id]])
        @avatar = Avatar.find(:first, :conditions => ['md5(user_id) = ?', params[:id] ])
        @character = Character.find(:all, :conditions => ['user_id = ?', params[:id]])
        #@stage = Stage.find(:first, :conditions => ['user_id = ? AND status = "enabled"', current_user.id])
    end

    def public_profile_modal
      @user = User.find(:first, :conditions =>['id = ?', params[:id]])
      @followers = Follower.find(:all, :conditions => ['leader = ?', params[:id]])
      @activities = Activity.find(:all, :conditions => ['user_id = ?', params[:id]])
      @avatar = Avatar.find(:first, :conditions => ['user_id = ?', params[:id] ])
      @character = Character.find(:all, :conditions => ['user_id = ?', Digest::MD5.hexdigest(params[:id].to_s)])
      render :layout => false
    end

    def follow
        if current_user
          f = Follower.new
          f.leader = params[:id]
          f.user_id = current_user.id
          f.save!
          #flash[:notice] = "Add Follower #" + params[:id].to_s
        else
          #flash[:notice] = "error 403"
        end

        render :text => 'follow'
    end
    
    def unfollow
        if current_user
          Follower.delete_all(['user_id = ? AND leader = ?', current_user.id, params[:id]])  
          flash[:notice] = "unfollow #" + params[:id].to_s
        else
          flash[:notice] = "error 403" 
        end

        render :text => 'unfollow'
    end
    def accounts_settings
      if current_user
        @character = Character.find(:all, :conditions => ['user_id = ?', current_user])
        @tokens = Token.find(:all)
        @stage_item = StageItem.find(:all, :conditions => ['user_id = ?', current_user.id])
        @performance_random = Stage.find(:all, :limit => 5, :order => 'rand()', :conditions =>['delete_status = 0'])

        _user = {:first_name => "saran", :last_name => "v", :email => "some_per@gmail.com", :address1 => "awesome ln", :city => "Austin", :state => "TX", :zip => "78759", :country => "USA", :phone => "5120070070" }

        tokens = MyToken.find(:all, :conditions => ['user_id = ?',current_user.id])
        @t = 0
        tokens.each do |d|
          if d.operation.nil?
            @t += d.amount.to_i
          else
            @t -= d.amount.to_i
          end

        end

        #using openstruct to access the hash by a dot notation
        @user = OpenStruct.new _user
        @currency = "USD"
        #a random invoice number for test.

        n = Order.new
        n.user_id = current_user.id
        n.save!

        @invoice = n.id

      else
        flash[:notice] = "error 403"
        redirect_to root_url
      end
    end

    def changeimage

      render :layout => false
    end

    def savecharacter
      if current_user

          Character.delete_all(['user_id = ?', current_user.id])
          params[:data].each do |d|
            p = Character.new
            p.section = d
            p.user_id = current_user.id
            p.save!
          end

          render :text => 'character save'
      else
          render :text => 'error 403'
      end
    end

    def saveinformation
      if current_user
          p = User.find(current_user.id)
          if params[:user][:image].nil?
              p.update_attributes({:name => params[:user][:name], :about => params[:user][:about], :gender => params[:user][:gender], :interest => params[:user][:interest], :hometown => params[:user][:hometown], :birthdate => params[:user][:birthdate] })
          else
              p.update_attributes({:name => params[:user][:name],:image => params[:user][:image], :about => params[:user][:about], :gender => params[:user][:gender], :interest => params[:user][:interest], :hometown => params[:user][:hometown], :birthdate => params[:user][:birthdate] })
          end

          session[:save] =  'Your changes have been save'
          redirect_to accounts_settings_url
      else
          redirect_to accounts_settings_url
      end
    end

    def saveprivacy

      if current_user
        f = Privacy.new
        f.user_id = current_user.id
        f.option1 = params[:privacy][:option1]
        f.option2 = params[:privacy][:option2]
        f.option3 = params[:privacy][:option3]
        f.option4 = params[:privacy][:option4]
        f.option5 = params[:privacy][:option5]
        f.option6 = params[:privacy][:option6]
        f.save!


        session[:saveprivacy] =  'Your changes have been save'
        redirect_to '/accounts_settings#privacy'
      else
        redirect_to '/accounts_settings#privacy'
      end

    end


  def share
    @id =  params[:id]
    render :layout => false
  end

  def saveimage


    p = User.find(current_user.id)
    p.update_attributes({:image => params[:imagen], :image_fb => '' })


    render :layout => false
  end


  def cashout
    tokens = MyToken.find(:all, :conditions => ['user_id = ?',current_user.id])
    @t = 0
    tokens.each do |d|
      if d.operation.nil?
        @t += d.amount.to_i
      else
        @t -= d.amount.to_i
      end

    end
    render :layout => false
  end

  def send_cashout
      mn = MoneyReturn.new
      mn.user_id =  params[:user]
      mn.tokens = params[:tokens]
      mn.status = 0
      mn.date_return = Date.new(Date.today.year,Date.today.mon, -1)
      mn.save!
      render :text => ''
  end


  def beta

    render :layout => false
  end

end
