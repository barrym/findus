Findus.Routers.Site = Backbone.Router.extend({
    routes: {
        ''               : 'home'
        'users'          : 'users'
        'categories/:id' : 'category'
    }

    # initialize: () ->

    home: () ->
        view = new Findus.Views.Home()
        $('#main').empty()
        $('#main').append(view.render().el)

    users: () ->
        @collection = new Findus.Collections.Users()
        @collection.fetch({
            success: (collection, resp) ->
                view = new Findus.Views.UsersIndex({collection:collection})
                $('#main').empty()
                $('#main').append(view.render().el)
            error: () ->
                console.log("error loading users index")

        })

    category: (id) ->
        category = new Findus.Models.Category({id:id})
        category.fetch({
            success: (model, resp) ->
                view = new Findus.Views.CategoriesShow({model:model})
                $('#main').empty()
                $('#main').append(view.render().el)

            error: () ->
                console.log("category not found")

        })

})
