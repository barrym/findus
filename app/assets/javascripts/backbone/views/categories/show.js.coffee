Findus.Views.CategoriesShow = Backbone.View.extend({

    events: {
        'click button#new_post' : 'new_post'
        'click button#post'     : 'save_post'
        'click button#cancel'   : 'cancel_post'
    }

    initialize: () ->
        _.bindAll(this, 'render')
        @model.bind('reset', @render)
        @model.bind('remove', @render)
        @model.posts.bind('add', @render)
        @model.posts.bind('remove', @render)
        @template = _.template($('#categories-show-template').html())

    render: () ->
        content = @template({
            name: @model.get('name')
            description: @model.get('description')
            posts: @model.posts.models
        })
        $(@el).html(content)
        return this

    new_post: () ->
        $('button#new_post').hide()
        $('#new_post_form').show()

    cancel_post: () ->
        $('button#new_post').show()
        $('#new_post_form').hide()
        return false

    save_post: () ->
        post = new Findus.Models.Post()
        post.url = "/categories/#{@model.id}/posts"
        post.save({
                subject : $('#subject').val()
                body    : $('#body').val()
            },
            {
            success: (model, resp) =>
                console.log("success")
                $('button#new_post').show()
                $('#new_post_form').hide()
                @model.posts.add(model)
                $('#alerts').empty()
                $('#alerts').append("<div class='alert-message success'>Post created</div>")
                setTimeout(() ->
                    $('.alert-message').fadeOut(500)
                , 2000)

            error: (model, errors) ->
                console.log("error")
                console.log errors
        })
        return false

})
