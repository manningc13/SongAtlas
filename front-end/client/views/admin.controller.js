"use strict";
(function(){
    angular
        .module("SongAtlas")
        .controller("AdminController", AdminController);

    function AdminController(DataService) {
        var vm = this;

        vm.getTracks = getTracks;
        vm.deleteTrack = deleteTrack;
        vm.editTrack = editTrack;
        vm.addTrack = addTrack;
        vm.saveEdit = saveEdit;
        vm.cancelEdit = cancelEdit;
        vm.updateTrackById = updateTrackById;

        vm.tracks = [];
        vm.trackEdit = {};

        function init() {
            getTracks();
        }

        init();

        function getTracks() {
            DataService.getTracks(function (response) {
                vm.tracks = response;
            });
        }

        function deleteTrack(trackId) {
            //DataService.deleteTrack(trackId, function (response) {
            //    console.log(trackId);
            //});
        }

        function editTrack(track) {
            vm.trackEdit.id = track.id;
            vm.trackEdit.track_name = track.track_name;
            vm.trackEdit.duration = track.duration;
            vm.trackEdit.album_id = track.album_id;
            vm.trackEdit.genre = track.genre;
            vm.trackEdit.spotify_id = track.spotify_id;
            vm.trackEdit.cloud_id = track.cloud_id;
            vm.trackEdit.last_fm_id = track.last_fm_id;
            vm.trackEdit.custom_url = track.custom_url;
        }

        function addTrack(track) {
            //console.log(track);
        }

        function saveEdit() {
            var newTrack = vm.trackEdit;
            var trackId = newTrack.id;
            updateTrackById(trackId, newTrack);
            // call updateTrackById() with id and new object;
        }

        function cancelEdit() {
            vm.trackEdit = null;
        }

        function updateTrackById(id, newTrack) {
            DataService.updateTrackById(id, newTrack)
                .then(function(response) {
                    init();
                });
        }
    }
})();