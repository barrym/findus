Findus.Models.User = Backbone.Model.extend({
    urlRoot: '/users'
})

Findus.Collections.Users = Backbone.Collection.extend({
    model: Findus.Models.User
    url: '/users'
    comparator: (user) ->
        user.get('name')
})
