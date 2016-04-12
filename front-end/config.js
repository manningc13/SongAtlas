(function(){
    angular
        .module("SongAtlas")
        .config(Configuration);

    function Configuration($routeProvider) {
        $routeProvider
            .when("/home", {
                templateUrl: "views/home.view.html",
                controller: "HomeController"
            })
            .when("/search", {
                templateUrl: "views/search.view.html",
                controller: "SearchController"
            })
            .otherwise({
                redirectTo: "/home"
            });
    }
})();