class TokensController < ApplicationController
  include ActiveMerchant::Billing::Integrations
  ActionView::Base.send(:include,ActiveMerchant::Billing::Integrations::ActionViewHelper)

  def buy
      if current_user
          @tokens = Token.find(:all)

          _user = {:first_name => "saran", :last_name => "v", :email => "some_per@gmail.com", :address1 => "awesome ln", :city => "Austin", :state => "TX", :zip => "78759", :country => "USA", :phone => "5120070070" }

          #using openstruct to access the hash by a dot notation
          @user = OpenStruct.new _user

          @amount = "0.01"
          @currency = "USD"

          #a random invoice number for test.
          @invoice = Integer rand(1000)
          #this will also come from your product database
          @item_number = "123"

      else
          flash[:notice] = "error 403"
          redirect_to root_url
      end
  end

  def show
   # -----

  end

  def cancel
    # -----
  end

  def sendtip
      t = Tip.new
      t.sender = params[:data][:sender]
      t.receiver = params[:data][:id]
      t.tokens =  params[:data][:tokens]
      t.stage_id = params[:data][:stage]
      t.save

      c = MyToken.new
      c.amount =  params[:data][:tokens]
      c.operation = '-'
      c.user_id = params[:data][:sender]
      c.save
      render :text => 'Tips Sent'

  end


  def send_heckle
    render :layout => false
  end
  def send_tips
    if current_user
      @id = params[:id]
      @stage = params[:stage]
      tokens = MyToken.find(:all, :conditions => ['user_id = ?',current_user.id])
      @t = 0
      tokens.each do |d|
        if d.operation.nil?
          @t += d.amount.to_i
        else
          @t -= d.amount.to_i
        end

      end
    end
     render :layout => false
  end
end
