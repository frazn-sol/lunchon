class Lunchon.Views.RedemptionModal extends Backbone.View
  template: JST['redemptions/redemption_modal']

  events:
    'click button.email': 'emailRedemption'
    'click button.to_pdf': 'pdfRedemption'

  emailRedemption: (event) ->
    event.preventDefault()

  pdfRedemption: (event) ->
    event.preventDefault()

  render: ->
    @$el.html(@template(redemption: @model))
    @$el.find('#barcode').barcode('123456789012','ean13', {barWidth: 2, barHeight:30, fontSize: 12})
    this
