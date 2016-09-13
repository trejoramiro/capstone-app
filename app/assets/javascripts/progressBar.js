/* global angular */

(function() {
    angular.module('app').controller('progressBar', function($scope, $http) {
        // $scope.setUp = function () {
        //     $http.get('/api/v1/messages.json').then(function (response) {
        //         $scope.messages = response.data;
        //     });
        // };
        // $scope.createNewMessage = function(inputMessage) {
        //     var params = {
        //         body: inputMessage
        //     };
        //     $http.post('/api/v1/messages', params).then(function(response) {
        //         $scope.newMessageBody = '';
        //     //     $scope.messages.splice(0,1);
        //     });
        // };

        window.$scope = $scope;
    });
})();
