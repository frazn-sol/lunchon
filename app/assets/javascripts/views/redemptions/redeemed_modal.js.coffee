class Lunchon.Views.RedeemedModal extends Backbone.View
  template: JST['redemptions/redeemed_modal']

  render: ->
    @$el.html(@template(redemption: @model))
    this
