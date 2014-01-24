require 'rubygems'
require 'twilio-ruby'

module SendSMS

  ACCOUNT_SID = ENV['account_sid'] 
  AUTH_TOKEN = ENV['auth_token']

  def twilio_send(customer,time_deliver,order_id)    
    # if it's not used anywhere else, it doesn't need to be an instance var
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    account = client.account
    # see comment about the test mode in local.config.rb
    if $test_mode == false 
       @message = account.sms.messages.create({
        :from => '441908410269', 
        :to => customer.phone, 
        :body => "Thank you #{customer.name} for your order no.#{order_id}, it will be delivered till #{time_deliver}"
      })

       # m =  @message.status
       # print m
    end
  end
end
