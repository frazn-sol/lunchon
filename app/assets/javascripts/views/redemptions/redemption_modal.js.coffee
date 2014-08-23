class Lunchon.Views.RedemptionModal extends Backbone.View
  template: JST['redemptions/redemption_modal']

  events:
    'click button.email': 'emailRedemption'
    'click button.to_pdf': 'pdfRedemption'


  emailRedemption: (event) ->
    event.preventDefault()
    @notYetImplemented()


  pdfRedemption: (event) ->
    event.preventDefault()
    @notYetImplemented()

  notYetImplemented: (msg) ->
    alert msg || 'Not Yet Implemented'

  render: ->
    restaurant_location = @.options.restaurant_location
    hours = restaurant_location.hours.split(',')
    @$el.html(@template(redemption: @model, restaurant_location: restaurant_location, hours: hours))
    console.log @model.get('code')
    @$el.find('#barcode').barcode(@model.get('code'),'ean13', {barWidth: 2, barHeight:30, fontSize: 12})
    this
