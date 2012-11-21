class Lunchon.Views.BuyButtonModal extends Backbone.View
  template: JST['buy_buttons/buy_button_modal']

  render: ->
    lunch_bag_items = Lunchon.lunch_bag.lunch_bag_items.models
    $(@el).html(@template(lunch_bag_items: lunch_bag_items, total_cost: Lunchon.lunch_bag.discounted_price))
    this
