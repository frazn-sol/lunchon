class Lunchon.Routers.Purchases extends Backbone.Router
  routes:
    'purchases': 'purchases'

  initialize: ->
    @collection = new Lunchon.Collections.Purchases
    this

  removeCart: ->
    $('#cart').remove()

  purchases: ->
    @collection.fetch( 
      success: => 
        @removeCart()
        view = new Lunchon.Views.PurchasesIndex(collection: @collection)
        $('#container').html(view.render().el)
      error: (data,error) =>
        if error['status'] == 401
          error_message = JSON.parse(error['responseText'])
          alert(error_message.error)
        Lunchon.deals.navigate('')
    )
