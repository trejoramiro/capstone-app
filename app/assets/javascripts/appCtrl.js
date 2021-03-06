/* global angular */

(function() {
    angular.module('app').controller('messagesCtrl', function($scope, $http) {
        $scope.setUp = function () {
            $http.get('/api/v1/messages.json').then(function (response) {
                $scope.messages = response.data;
            });
        };
        $scope.createNewMessage = function(inputMessage) {
            var params = {
                body: inputMessage
            };
            $http.post('/api/v1/messages', params).then(function(response) {
                $scope.newMessageBody = '';
            });
        };

        $scope.sendSearchQuery = function(){
          $http.get('/venues/:group_id', params).then(function(response) {

          });
        };

        $scope.setEvents = function(events) {

          console.log(events);
          $scope.availableOptions = [
            {id: '11', name: 'Bar Crawl'},
            {id: '10', name: 'Karaoke Night'}
          ]
        }

    $scope.selectedEvent;

    $scope.selectedCircles = [];

    window.$scope = $scope;

    $scope.sendSelectedOptions = function(selectedEvent) {
      $scope.selectedEvent = selectedEvent;

      venues = [];
      for(var i = 0; i < $scope.selectedCircles.length; i++) {
        hash = {
          name: $scope.selectedCircles[i].className,
          location: $scope.selectedCircles[i].location,
          lat: $scope.selectedCircles[i].lat,
          lng: $scope.selectedCircles[i].lng
        }
        venues.push(hash)
      }

      var params = {
        event_id: selectedEvent,
        group_id: 67,
        venue_ids: venues
      };

      $http.post('/venues', params).then(function(response) {
        console.log(response);
        window.location = '/groups/' + response.data.group_id;
      });

      console.log(params);
    }
    });
})();
