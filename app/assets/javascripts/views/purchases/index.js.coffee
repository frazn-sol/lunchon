class Lunchon.Views.PurchasesIndex extends Backbone.View

  template: JST['purchases/index']
  model: Lunchon.Models.Purchase
  tagName: 'ul'
  className: 'purchases well'

  initialize: ->
    #@collection.on('reset', @render, this)
    @collection.on('fetch', @render, this)

  render: ->
    $('#container').html(@el)
    @collection.each(@appendPurchase)
    this

  appendPurchase: (purchase, index) =>
    view = new Lunchon.Views.Purchase(model: purchase)
    $(@el).append(view.render().el)
