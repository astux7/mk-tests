require 'rubygems'
require 'twilio-ruby'
require './lib/local.config.rb'


puts $account_sid
# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new($account_sid, $auth_token)
time = (Time.new + 60*60)
time_deliver = time.strftime("%Y-%m-%d %H:%M")
order_id = 88
@account = @client.account
@message = @account.sms.messages.create({:from => '441908410269', :to => '07718172778', :body => "Thank you for your order no.#{order_id}, it will be delivered till #{time_deliver}"})

 puts @massage.MessageStatus
mm = @massage.MessageStatus.to_s
 puts mm