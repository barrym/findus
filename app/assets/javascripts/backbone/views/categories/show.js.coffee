Findus.Views.CategoriesShow = Backbone.View.extend({
    initialize: () ->
        _.bindAll(this, 'render')
        @model.bind('reset', @render)
        @model.bind('remove', @render)
        @template = _.template($('#categories-show-template').html())

    render: () ->
        content = @template(@model.toJSON())
        $(@el).html(content)
        return this
})
