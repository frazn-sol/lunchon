class Lunchon.Routers.Deals extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new Lunchon.Collections.Deals
    @collection.fetch()

  index: ->
    view = new Lunchon.Views.DealsIndex(collection: @collection)
    $('#container').html(view.render().el)