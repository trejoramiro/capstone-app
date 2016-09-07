
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


    data = Unirest.get("https://api.foursquare.com/v2/venues/explore?ll=41.895273,-87.67545799999999&query=sushi&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&v=20160809").body
    venues_data = data['response']['groups'][0]['items']

    index = 0
    message_body = ""
    3.times do
        message_body = message_body + venues_data[index]['venue']['name'] + "\n" + venues_data[index]['venue']['location']['address'] + "\n" + venues_data[index]['venue']['rating'].to_s +  "\n\n"
        index = index + 1
    end

    @client.messages.create(
    from: ENV['TWILIO_NUM'],
    to: from_number,
    body: message_body
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
