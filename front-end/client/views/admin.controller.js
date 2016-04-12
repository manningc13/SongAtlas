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

        vm.tracks = [];

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
            //console.log(track);
        }

        function addTrack(track) {
            //console.log(track);
        }
    }
})();