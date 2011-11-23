Findus.Routers.Site = Backbone.Router.extend({
    routes: {
        ''      : 'home',
        'users' : 'users'
    }

    # initialize: () ->

    home: () ->
        homeView = new Findus.Views.Home()
        $('#main').empty()
        $('#main').append(homeView.render().el)

    users: () ->
        console.log("implement a users view")


})
