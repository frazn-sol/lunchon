class Lunchon.Views.RedemptionModal extends Backbone.View
  template: JST['redemptions/redemption_modal']

  events:
    'click button.email': 'emailRedemption'
    'click button.to_pdf': 'pdfRedemption'

  emailRedemption: (event) ->
    event.preventDefault()
    alert "email"
    #$('#modal').modal('hide')

  pdfRedemption: (event) ->
    event.preventDefault()
    alert "pdf"
    #$('#modal').modal('hide')

  render: ->
    console.log @model
    $(@el).html(@template(redemption: @model))
    this
