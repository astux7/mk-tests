require 'rubygems'
require 'twilio-ruby'

module SendSMS

  def twilio_send(customer,time_deliver,order_id)
    puts "\n Messege on your way !!!"
    @client = Twilio::REST::Client.new($account_sid, $auth_token)
    account = @client.account
    if $test_mode == false 
       @message = account.sms.messages.create({
        :from => '441908410269', 
        :to => customer.phone, 
        :body => "Thank you #{customer.name} for your order no.#{order_id}, it will be delivered till #{time_deliver}"
      })
       m =  @message.status
       print m
    else
      puts "(: imagine message is sent :) "
    end
  end
end
