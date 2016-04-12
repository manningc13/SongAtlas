"use strict";
(function(){
    angular
        .module("SongAtlas")
        .factory("DataService", DataService);

    function DataService($http) {
        var api = {
            getTracks: getTracks
        };

        return api;

        function getTracks(callback) {
            $http({
                method: 'GET',
                url: '/api/tracks'
            }).then(function successCallback(response) {
                callback(response.data);
            }, function errorCallback(response) {
                console.log("Error");
            });
        }
    }
})();