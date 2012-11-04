class Lunchon.Views.LunchBagItem extends Backbone.View
  template: JST['lunch_bag_items/lunch_bag_item']

  events:
    'click a.close': 'removeItem'

  removeItem: ->
    console.log('remove item')
    #Lunchon.cart.removeItem @.model
    #$(@el).remove()

  
  render: ->
    $(@el).html(@template(lunch_bag_item: @model))
    this
