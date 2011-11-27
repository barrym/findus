Findus.Views.CategoriesShow = Backbone.View.extend({
    initialize: () ->
        _.bindAll(this, 'render')
        @model.bind('reset', @render)
        @model.bind('remove', @render)
        @template = _.template($('#categories-show-template').html())

    render: () ->
        content = @template({
            name: @model.get('name')
            description: @model.get('description')
            posts: @model.posts.models
        })
        $(@el).html(content)
        return this
})
