/* global App */
App.messages = App.cable.subscriptions.create('MessagesChannel', {
    connected: function() {
    },

    received: function(data) {
        // var message = "<hr><p><b>" + data.name + ": </b>" + data.body + "</p><hr>";
        // console.log(data);
        // $("#newMessages").append(message);
        var $scope = angular.element(document.getElementById('messagesCtrl')).scope();
        $scope.messages.push(data);
        $scope.$apply();
    },

    disconnected: function() {
    }

});
