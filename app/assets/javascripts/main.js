/* global $ */
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
        map = new google.maps.Map(document.getElementById(idString), {
            center: {lat: parseInt(data.data[i].lat), lng: parseInt(data.data[i].lng) },
            zoom: 15
            });
      }

    });


}


// Initialize collapse button
(function($){
  $(function() {

    $('.button-collapse').sideNav();

    $(document).ready(function(){
      $('.parallax').parallax();
    });


  });
})(jQuery);
  // Initialize collapsible (uncomment the line below if you use the dropdown variation)
  //$('.collapsible').collapsible();


function myFunction() {
    document.getElementById("myCheck").click();
}
