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
        $('#working').show()
        @collection = new Findus.Collections.Users()
        @collection.fetch({
            success: (collection, resp) ->
                view = new Findus.Views.UsersIndex({collection:collection})
                $('#main').empty()
                $('#main').append(view.render().el)
                $('#working').hide()
            error: () ->
                console.log("error loading users index")
                $('#working').hide()

        })

    category: (id) ->
        $('#working').show()
        category = new Findus.Models.Category({id:id})
        category.fetch({
            success: (model, resp) ->
                model.posts.fetch({
                    success: () ->
                        view = new Findus.Views.CategoriesShow({model:model})
                        $('#main').empty()
                        $('#main').append(view.render().el)
                        $('#working').hide()
                })

            error: () ->
                console.log("category not found")
                $('#working').hide()
        })

})
