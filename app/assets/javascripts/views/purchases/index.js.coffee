class Lunchon.Views.PurchasesIndex extends Backbone.View

  template: JST['purchases/index']
  model: Lunchon.Models.Purchase

  initialize: ->
    @collection.on('fetch', @render, this)

  render: ->
    @$el.html(@template())
    @collection.each(@appendPurchase)
    this

  appendPurchase: (purchase, index) =>
    view = new Lunchon.Views.Purchase(model: purchase)
    @$el.find('ul.purchases').append(view.render().el)
