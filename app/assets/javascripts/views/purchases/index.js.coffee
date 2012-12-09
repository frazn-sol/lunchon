class Lunchon.Views.PurchasesIndex extends Backbone.View

  template: JST['purchases/index']
  model: Lunchon.Models.Purchase

  initialize: ->
    @collection.on('fetch', @render, this)

  render: ->
    @$el.html(@template())
    @collection.each(@appendPurchase)
    @$el.find('ul.purchases').append $('<li>Clicking "Generate Redemption Certificate" will void ALL other certificates for that item</span>')
    this

  appendPurchase: (purchase, index) =>
    view = new Lunchon.Views.Purchase(model: purchase)
    @$el.find('ul.purchases').append(view.render().el)
