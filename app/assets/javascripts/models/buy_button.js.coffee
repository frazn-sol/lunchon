class Lunchon.Models.BuyButton extends Backbone.Model

  initialize: ->
    is_user_signed_in = $('#container').data('is_user_signed_in')
    @.set("is_user_signed_in", is_user_signed_in)
    view = new Lunchon.Views.BuyButton(model: @)
    $('#cart div.buy_button').html(view.render().el)

