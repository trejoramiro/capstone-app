var getLocation = function() {
    navigator.geolocation.getCurrentPosition(function(position) {
        console.log(position.coords.latitude);
        console.log(position.coords.longitude);
        $.ajax({
            url: "/locations/41",
            type: "POST",
            data: {
                coordinates: {
                    latitude: position.coords.latitude,
                    longitude: position.coords.longitude
                }
            },
            success: function(resp) {

                console.log("Data successfully saved.");
                $('input[name=location]').val('Current Location');
            }
        });
    })
}

var initMap = function() {
    //make a get request to the server and return json data
    var myLatLng = {
        lat: 34,
        lng: 32
    };
    var map = new google.maps.Map(document.getElementById('map'), {
        center: myLatLng,
        zoom: 14
    });
    var center = new google.maps.Marker({
        position: myLatLng,
        map: map
    });
    center.setMap(map);
    // <% @venues.each do |venue| %>
    // var coord = {lat: <%= venue["venue"]["location"]["lat"] %>, lng: <%= venue["venue"]["location"]["lng"] %>}
    // var marker = new google.maps.Marker({
    //   position: coord,
    //   map: map
    // });
    // marker.setMap(map);
    // <% end %>
}
