class Api::V1::D3sController < ApplicationController

  def index
    data = Unirest.get("https://api.foursquare.com/v2/venues/explore?ll=#{params[:coordinates]}&query=#{params[:search]}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&v=20160809").body
    @venues = []
    venues_data = data['response']['groups'][0]['items']
    center = [41.895273,-87.67545799999999]
    @data =  []
    venues_data.each do |data|
      distance = (Math.sqrt( ((data['venue']['location']['lat'] - center[0])**2) + ((data['venue']['location']['lng'] - center[1])**2)) * 1000000).round
      my_data = [ 'cluster',
        data['venue']['name'],
        distance,
        data['venue']['location']['address'],
        data['venue']['rating'],
        data['venue']['location']['lat'],
        data['venue']['location']['lng']
      ]
      @data.push(my_data)
    end

    first = 0
    last = @data.length - 1
    num = @data.length / 2
    @data = @data.sort do |a,b| a[2] <=> b[2] end

    num.times do
      swap_val = @data[first][2]
      @data[first][2] = @data[last][2]
      @data[last][2] = swap_val
      first = first + 1
      last = last - 1
    end

    max = @data[0][2]
    min =  @data[-1][2]
    mid =  (max + min)/ 2

    # compute values for rating
    @data.each do |row|
      if row[4]
        if row[4] >= 8.0
          product = (row[4] * 1500).round
          row << product
        else
          product = (row[4] * 150).round + 1000
          row << product # pushing into row
        end
      else
        row[4] = 100
      end
    end

    @data.each do |data|
      hash = {
        "name" => data[1],
        "distance" => data[2],
        "rating" => data[4],
        "value2" => data[7],
        "location" => data[3],
        "lat" => data[5],
        "lng" => data[6]
      }
      if data[2] <= mid
          hash["packageName"] = "scale"
      else
         hash["packageName"] = "cluster"
      end
      @venues.push(hash)
    end
    first = @venues.shift
    @venues = @venues.shuffle
    @venues.insert(0, first)

    render 'index.json.jbuilder'
  end
end
