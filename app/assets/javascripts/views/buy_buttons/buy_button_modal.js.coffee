class Lunchon.Views.BuyButtonModal extends Backbone.View
  template: JST['buy_buttons/buy_button_modal']

  events:
    "click button.purchase": "purchase"
    
  purchase: (event) ->
    event.preventDefault()
    #some credit card code
    #a call to the server
    $.ajax
      url: 'api/purchases'
      dataType: 'json'
      type: 'post'
      success: (data) ->
        $('#modal').modal('hide')
        #$('#cart').remove()
        #navigate to the user's purchase page
        Lunchon.purchases.removeCart()
        Lunchon.purchases.collection.reset(data)
        Lunchon.purchases.navigate("purchases", {trigger: true})

  render: ->
    lunch_bag_items = Lunchon.lunch_bag.lunch_bag_items.models
    csrf_token = $('meta[name="csrf-token"]').attr('content')
    csrf_param = $('meta[name="csrf-param"]').attr('content')
    $(@el).html(@template(lunch_bag_items: lunch_bag_items, csrf_token: csrf_token, csrf_param: csrf_param, total_cost: Lunchon.lunch_bag.discounted_price))
    this
