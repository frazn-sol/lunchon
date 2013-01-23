class Lunchon.Models.LunchBag extends Backbone.Model

  initialize: ->
    existing_lunch_bag = $('#container').data('lunch_bag')
    @build(existing_lunch_bag)

  addItem: (deal) ->
    that = @
    $.ajax
      url: 'lunch_bag/add_item'
      dataType: 'json'
      type: 'post'
      data: {deal_id: deal.id}
      success: (data) ->
        that.build(data)

  discountStr: ->
    "#{@.discount*100}%"

  build: (lunch_bag_data) ->
    return unless lunch_bag_data
    @lunch_bag_items = new Lunchon.Collections.LunchBagItems
    @.total_price = lunch_bag_data['total_price']
    @.discounted_price = lunch_bag_data['discounted_price']
    @.discount = lunch_bag_data['discount']
    view = new Lunchon.Views.LunchBag(model: @)
    $('#cart div.lunch_bag').html(view.render().el)

    existing_items = lunch_bag_data['items']
    $lunch_bag = $('div#lunch_bag')
    $lunch_bag.html('')
    _.each existing_items, (item) =>
      lunch_bag_item = new Lunchon.Models.LunchBagItem quantity: item['quantity'], deal_id: item['deal_id'], name: item['name'],  original_price: item['original_price']
      @lunch_bag_items.add lunch_bag_item
      item_view = new Lunchon.Views.LunchBagItem(model: lunch_bag_item)
      $lunch_bag.append(item_view.render().el)



