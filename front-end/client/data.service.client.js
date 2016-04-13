"use strict";
(function(){
    angular
        .module("SongAtlas")
        .factory("DataService", DataService);

    function DataService($http) {
        var api = {
            getTracks: getTracks,
            updateTrackById: updateTrackById,
            deleteTrack: deleteTrack,
            addTrack: addTrack,
            getTracksWithDetails: getTracksWithDetails,
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

        function updateTrackById(id, newTrack) {
            return $http.put("/api/tracks/" + id, newTrack);
        }

        function deleteTrack(id) {
            return $http.delete("/api/tracks/" + id);
        }

        function addTrack(newTrack) {
            return $http.post("/api/tracks/", newTrack);
        }

        function getTracksWithDetails(trackName) {
            return $http.get("/api/tracks/" + trackName);
        }
    }
})();