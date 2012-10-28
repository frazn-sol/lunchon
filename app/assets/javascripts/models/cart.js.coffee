class Lunchon.Models.Cart extends Backbone.Model

  initialize: ->
    @cart_items = new Lunchon.Collections.CartItems
    @cart_items.on 'add', @printTotal, this
    @cart_items.on 'remove', @printTotal, this

  addDeal: (deal) ->
    cart_item = new Lunchon.Models.CartItem deal_id: deal.get('id'), deal_name: deal.get('name'), price: deal.get('price'), original_price: deal.get('original_price')
    @cart_items.add cart_item
    cart_item_view = new Lunchon.Views.CartItem(model: cart_item)
    $('div#cart_items').append(cart_item_view.render().el)

  removeItem: (item) ->
    @cart_items.remove item

  printTotal: ->
    #y = _.groupBy @cart_items.models, (e) ->
      #e.get('deal_id')
    sum = _.reduce @cart_items.models, ((sum, item) -> sum + item.get('price')), 0
    formattedSum = accounting.formatMoney sum
    $('#cart_total').find('span.total').html(formattedSum)
