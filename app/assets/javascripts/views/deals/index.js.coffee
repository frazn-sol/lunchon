class Lunchon.Views.DealsIndex extends Backbone.View

  template: JST['deals/index']
  model: Lunchon.Models.Deal
  tagName: 'ul'

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).addClass('thumbnails deals').html(@template())
    $(@el).parent().append($('<div>').attr('id', 'modal').addClass('modal hide fade'))
    @collection.each(@appendDeal)
    this

  appendDeal: (deal) ->
    view = new Lunchon.Views.Deal(model: deal)
    $('ul.deals').append(view.render().el)
