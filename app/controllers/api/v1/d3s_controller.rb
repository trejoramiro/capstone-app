class Api::V1::D3sController < ApplicationController

  def index
    data = Unirest.get("https://api.foursquare.com/v2/venues/explore?ll=41.895273,-87.67545799999999&query=sushi&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&v=20160809").body
    @venues = []
    venues_data = data['response']['groups'][0]['items']
    # venues_data.each do |data|
    #   hash = {
    #   "name" => data['venue']['name'],
    #   "lat" => data['venue']['location']['lat'],
    #   "lng" => data['venue']['location']['lng']
    # }
    # @venues.push(hash)
    # end
    center = [41.895273,-87.67545799999999]
    @data =  []
    venues_data.each do |data|
      distance = (Math.sqrt( ((data['venue']['location']['lat'] - center[0])**2) + ((data['venue']['location']['lng'] - center[1])**2)) * 1000000).round
      my_data = [ 'cluster', data['venue']['name'], distance, data['venue']['location']['address'],data['venue']['rating'] ]
      @data.push(my_data)
      # hash = {
      #   "packageName" => "cluster",
      #   "name" => data['venue']['name'],
      #   "distance" => distance
      # }
      # @venues.push(hash)
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

    # binding.pry
    @data.each do |data|
      hash = {
        # "packageName" => data[0],
        "name" => data[1],
        "distance" => data[2]
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
    # binding.pry
    render 'index.json.jbuilder'
  end
end
