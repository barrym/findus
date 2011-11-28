Findus.Models.Post = Backbone.Model.extend({

})

Findus.Collections.Posts = Backbone.Collection.extend({
    model: Findus.Models.Post

    comparator: (category) ->
        -category.get('created_at')
})
