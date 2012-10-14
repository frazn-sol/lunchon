class Lunchon.Views.DealModal extends Backbone.View
  template: JST['deals/deal_modal']

  render: ->
    console.log('test')
    $(@el).html(@template(deal: @model))
    this

