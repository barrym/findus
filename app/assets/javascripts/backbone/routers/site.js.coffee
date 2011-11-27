Findus.Routers.Site = Backbone.Router.extend({
    routes: {
        ''      : 'home',
        'users' : 'users'
    }

    # initialize: () ->

    home: () ->
        view = new Findus.Views.Home()
        $('#main').empty()
        $('#main').append(view.render().el)

    users: () ->
        view = new Findus.Views.UsersIndex()
        $('#main').empty()
        $('#main').append(view.render().el)

})
