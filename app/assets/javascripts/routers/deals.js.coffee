class Lunchon.Routers.Deals extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new Lunchon.Collections.Deals
    @collection.reset($('#container').data 'deals')
    this

  index: ->
    if @collection.length > 0
      view = new Lunchon.Views.DealsIndex(collection: @collection)
      $('#container').html(view.render().el)
