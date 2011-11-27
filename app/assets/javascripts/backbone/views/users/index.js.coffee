Findus.Views.UsersIndex = Backbone.View.extend({
    initialize: () ->
        _.bindAll(this, 'render')
        @collection = new Findus.Collections.Users()
        @collection.fetch()
        @collection.bind('reset', @render)
        @collection.bind('remove', @render)
        @template = _.template($('#users-index-template').html())

    render: () ->
        content = @template({users: @collection.models})
        $(@el).html(content)
        return this
})
