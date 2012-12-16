class Lunchon.Views.DealModal extends Backbone.View
  template: JST['deals/deal_modal']

  events:
    'click button.add_to_cart': 'addToLunchBag'

  addToLunchBag: (event) ->
    event.preventDefault()
    Lunchon.lunch_bag.addItem @model unless @model.get('remaining') == 0
    $('#modal').modal('hide')

  render: ->
    shortestDistance = @model.get('distances')[0]?.toFixed(0)
    $(@el).html(@template(deal: @model, shortestDistance: shortestDistance))
    this

