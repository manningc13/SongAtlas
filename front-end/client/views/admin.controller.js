"use strict";
(function(){
    angular
        .module("SongAtlas")
        .controller("AdminController", AdminController);

    function AdminController(DataService) {
        DataService.getTracks(function(response) {
            console.log(response);
        });
    }
})();