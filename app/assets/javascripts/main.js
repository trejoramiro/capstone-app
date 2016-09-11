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

function initMap() {

    $.get("/api/v1/maps.json", function (data) {

      var map;
      for(var i = 0; i < data.data.length; i++) {

        var id = data.data[i].id;
        var idString = id.toString();
        console.log(idString)
        map = new google.maps.Map(document.getElementById(idString), {
            center: {lat: -34.397, lng: 150.644},
            zoom: 8
            });
      }

    // var array = JSON.stringify(data)
    // console.log(data.data.length)

    });


}
