class Lunchon.Views.LunchBag extends Backbone.View
  template: JST['lunch_bags/lunch_bag']

  events: 
    'click a.empty_lunch_bag': 'empty_lunch_bag'

  empty_lunch_bag: (event) ->
    that = Lunchon.lunch_bag

    $.ajax
      url: 'lunch_bag/clear'
      dataType: 'json'
      type: 'post'
      success: (data) ->
        that.build(data)

  
  render: ->
    $(@el).html(@template(lunch_bag: @model))
    this

