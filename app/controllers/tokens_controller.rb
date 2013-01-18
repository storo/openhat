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

  def notify
    notify = Paypal::Notification.new(request.raw_post)
    #p "Notification object is #{notify}"
    #if notify.acknowledge
    #  p "Transaction ID is #{notify.transaction_id}"
    #  p "Notification object is #{notify}"
    #  p "Notification status is #{notify.status}"
    #end

    p =  Payment.new
    p.invoice = params[:invoice]
    p.payer_id = params[:payer_id]
    p.payment_date = params[:payment_date]
    p.payment_status = params[:payment_status]
    p.first_name = params[:first_name]
    p.mc_fee = params[:mc_fee]
    p.business = params[:business]
    p.quantity = params[:quantity]
    p.payer_email = params[:payer_email]
    p.payment_type = params[:payment_type]
    p.last_name = params[:last_name]
    p.payment_fee = params[:payment_fee]
    p.item_name = params[:item_name]
    p.mc_currency = params[:mc_currency]
    p.item_number = params[:item_number]
    p.residence_country = params[:residence_country]
    p.payment_gross = params[:payment_gross]

    p.save!

    if p.payment_status == 'Completed'
        o = Order.find(:first, :conditions => ['id = ?', p.invoice])
        t = Token.find(:first, :conditions => ['id = ?', p.item_number])
        mt = MyToken.new
        mt.amount = t.quantity
        mt.user_id = o.user_id
        mt.payment_id = p.id
        mt.save!

    end

    render :nothing => true
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
    @Heckles = ElementStage.find(:all, :select => 'types, sum(amount) as total', :group => 'types', :conditions => ['user_id = ?', current_user.id])

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

  def buytokens
    if current_user
        tokens = MyToken.find(:all, :conditions => ['user_id = ?',current_user.id])
        @t = 0
        tokens.each do |d|
            if d.operation.nil?
                @t += d.amount.to_i
            else
                @t -= d.amount.to_i
            end
        end

        if @t <= 0
            text = '300'
        else
            if @t >= params[:tokens].to_i
                element = ElementStage.new
                element.types = params[:heckle]
                element.user_id = current_user.id
                element.amount = params[:amount]
                element.save!

                mytoken = MyToken.new
                mytoken.amount = params[:tokens]
                mytoken.user_id = current_user.id
                mytoken.operation = '-'
                mytoken.description  = 'buy heckle "' + params[:heckle] + '"  '+ params[:amount] +' x ' + params[:tokens]
                mytoken.save!

                text = '200'
            else
                text = '300'
            end
        end
    else
        text = '500'
    end

    render :text => text
  end

  def buystages
    if current_user
      tokens = MyToken.find(:all, :conditions => ['user_id = ?',current_user.id])
      @t = 0
      tokens.each do |d|
        if d.operation.nil?
          @t += d.amount.to_i
        else
          @t -= d.amount.to_i
        end
      end

      if @t <= 0
        text = '300'
      else
        if @t >= params[:tokens].to_i
          element = StageItem.new
          element.item = params[:item]
          element.user_id = current_user.id
          element.amount = params[:tokens]
          element.save!

          mytoken = MyToken.new
          mytoken.amount = params[:tokens]
          mytoken.user_id = current_user.id
          mytoken.operation = '-'
          mytoken.description  = 'buy heckle "' + params[:stage] + '"  tokens: ' + params[:tokens]
          mytoken.save!

          text = '200'
        else
          text = '300'
        end
      end
    else
      text = '500'
    end

    render :text => text
  end

  def discountHeckle
      element = ElementStage.new
      element.types = params[:heckle]
      element.user_id = current_user.id
      element.amount = -1
      element.save!

      render :text => '200'
  end

end
