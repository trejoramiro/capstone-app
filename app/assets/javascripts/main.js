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
        lat: -34.397,
        lng: 150.644
    };
    var map = new google.maps.Map(document.getElementById('map'), {
        center: myLatLng,
        zoom: 8
    });
    var center = new google.maps.Marker({
        position: myLatLng,
        map: map
    });
    center.setMap(map);
    console.log("hello")
}
