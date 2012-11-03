class Lunchon.Views.DealsIndex extends Backbone.View

  template: JST['deals/index']
  model: Lunchon.Models.Deal
  tagName: 'ul'

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).addClass('thumbnails deals').html(@template())
    @collection.each(@appendDeal)
    this

  appendDeal: (deal) =>
    view = new Lunchon.Views.Deal(model: deal)
    $(@el).append(view.render().el)
