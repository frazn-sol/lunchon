class Lunchon.Views.Purchase extends Backbone.View

  template: JST['purchases/purchase']
  tagName: 'li'
  className: 'purchase'

  render: ->
    $(@el).html(@template(purchase: @model))
    this
