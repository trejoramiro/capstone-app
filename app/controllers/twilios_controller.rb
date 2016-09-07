
class TwiliosController < ApplicationController

def index

  @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

  @client.messages.create(
  from: ENV['TWILIO_NUM'],
  to: ENV['MY_PHONE_NUM'],
  body: 'Hey there!'
  )

  redirect_to '/login'
end

def reply
    message_body = params["Body"]
    message = message_body.split(" ")

    from_number = params["From"]
    # boot_twilio
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

    if message[0].upcase == "SEARCH"

    @client.messages.create(
      from: ENV['TWILIO_NUM'],
      to: from_number,
      body: "You searched for " + message[1]
    )

    elsif message[0].upcase == "VOTE"
      @client.messages.create(
        from: ENV['TWILIO_NUM'],
        to: from_number,
        body: "You voted for " + message[1]
      )
    else
    @client.messages.create(
      from: ENV['TWILIO_NUM'],
      to: from_number,
      body: "Did not work."
    )
    end
    redirect_to '/login'
end

end
