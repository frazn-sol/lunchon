class Lunchon.Views.DealsIndex extends Backbone.View

  template: JST['deals/index']
  model: Lunchon.Models.Deal

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).addClass('thumbnails deals').html(@template())
    @collection.each(@appendDeal)
    this

  appendDeal: (deal, index) =>
    if index < 2
      deal.set('size', 'featured')
      view = new Lunchon.Views.Deal(model: deal)
      $(@el).find('ul.featured').append(view.render().el)
    else
      deal.set('size', 'thumb')
      view = new Lunchon.Views.Deal(model: deal)
      $(@el).find('ul.thumb').append(view.render().el)
