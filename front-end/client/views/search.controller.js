"use strict";
(function(){
    angular
        .module("SongAtlas")
        .controller("SearchController", SearchController);

    function SearchController(DataService) {
        var vm = this;

        vm.search = search;

        vm.searchResults = [];
        vm.searchTerm = '';

        function search() {
            var trackName = vm.searchTerm;
            DataService.getTracksWithDetails(trackName)
                .then(function(response) {
                    vm.searchResults = removeNullURLS(response.data);
                });
        }

        function removeNullURLS(tracksWithDetails) {
            for (var i = 0; i < tracksWithDetails.length; i++) {
                for (var j = 0; j < tracksWithDetails[i].details.urls.length; j++) {
                    for (var item in tracksWithDetails[i].details.urls[j]) {
                        if (tracksWithDetails[i].details.urls[j][item] === 'NULL') {
                            tracksWithDetails[i].details.urls.splice(j, 1);
                        }
                    }
                }
            }
            return tracksWithDetails;
        }
    }
})();