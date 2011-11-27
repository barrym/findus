Findus.Models.Category = Backbone.Model.extend({
    urlRoot: '/categories'

    initialize: () ->
        @posts = new Findus.Collections.Posts
        @posts.url = "/categories/#{@id}/posts"

})

Findus.Collections.Categories = Backbone.Collection.extend({
    model: Findus.Models.Category
    url: '/categories'

    comparator: (category) ->
        category.get('name')

})
