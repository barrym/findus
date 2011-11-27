Findus.Models.Category = Backbone.Model.extend({
    urlRoot: '/categories'
})

Findus.Collections.Categories = Backbone.Collection.extend({
    model: Findus.Models.Category
    url: '/categories'
    comparator: (category) ->
        category.get('name')
})
