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

        function getTracks() {
            DataService.getTracks(function (response) {
                console.log(response);
            });
        }

        function deleteTrack(trackId) {
            //DataService.deleteTrack(trackId, function (response) {
                console.log(trackId);
            //});
        }

        function editTrack(track) {
            console.log(track);
        }

        function addTrack(track) {
            console.log(track);
        }
    }
})();