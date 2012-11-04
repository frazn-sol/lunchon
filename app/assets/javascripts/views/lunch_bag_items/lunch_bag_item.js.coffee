class Lunchon.Views.LunchBagItem extends Backbone.View
  template: JST['lunch_bag_items/lunch_bag_item']

  events:
    'click a.close': 'removeItem'
    'change input.quantity': 'changeQuantity'

  removeItem: ->
    @callChangeQuantity(0)
    $(@el).remove()
  
  changeQuantity: (event) ->
    event.preventDefault()
    @callChangeQuantity($(event.target).val())

  callChangeQuantity: (quantity) ->
    deal_id = @model.get('deal_id')
    $.ajax
      url: 'lunch_bag/set_quantity'
      dataType: 'json'
      type: 'post'
      data: {deal_id: deal_id, quantity: quantity}
      success: (data) ->
        Lunchon.lunch_bag.build(data)

  render: ->
    $(@el).html(@template(lunch_bag_item: @model))
    this
