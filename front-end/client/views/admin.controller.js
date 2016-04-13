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
        vm.trackCreate = {};

        function init() {
            getTracks();
        }

        init();

        function getTracks() {
            DataService.getTracks(function (response) {
                vm.tracks = response;
            });
        }

        function deleteTrack(index) {
            var trackId = vm.tracks[index].id;
            DataService.deleteTrack(trackId)
                .then(function(response) {
                    vm.tracks = response.data;
                });
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

        function addTrack() {
            var newTrack = vm.trackCreate;
            DataService.addTrack(newTrack)
                .then(function(response) {
                    vm.tracks = response.data;
                });
        }

        function saveEdit() {
            var newTrack = vm.trackEdit;
            var trackId = newTrack.id;
            updateTrackById(trackId, newTrack);
        }

        function cancelEdit() {
            vm.trackEdit = {};
        }

        function updateTrackById(id, newTrack) {
            DataService.updateTrackById(id, newTrack)
                .then(function(response) {
                    init();
                });
        }
    }
})();