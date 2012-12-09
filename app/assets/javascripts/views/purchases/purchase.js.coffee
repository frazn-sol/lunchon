class Lunchon.Views.Purchase extends Backbone.View

  template: JST['purchases/purchase']
  tagName: 'li'
  className: 'purchase'

  initialize: ->
    @collection = new Lunchon.Collections.PurchaseItems(@model.get('purchase_items'))
    @collection.each(@appendPurchaseItem)


  render: ->
    @$el.html(@template(purchase: @model))
    @collection.each(@appendPurchaseItem)
    this

  appendPurchaseItem: (item, index) =>
    view = new Lunchon.Views.PurchaseItem(model: item)
    @$el.find('ul.purchase_items').append(view.render().el)

