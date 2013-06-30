class Lunchon.Views.BuyButtonModal extends Backbone.View
  template: JST['buy_buttons/buy_button_modal']

  events:
    "click button.purchase": "purchase"

  purchase: (event) ->
    event.preventDefault()
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
    purchase.processCard()

  render: ->
    lunch_bag_items = Lunchon.lunch_bag.lunch_bag_items.models
    csrf_token = $('meta[name="csrf-token"]').attr('content')
    csrf_param = $('meta[name="csrf-param"]').attr('content')
    $(@el).html(@template(lunch_bag_items: lunch_bag_items, csrf_token: csrf_token, csrf_param: csrf_param, total_cost: Lunchon.lunch_bag.discounted_price))
    purchase.setupForm()
    this

  purchase =
    disable_button: ->
      $('button.purchase').attr('disabled', true).text('Please wait...')

    enable_button: ->
      $('button.purchase').attr('disabled', false).text('Complete Purchase')

    setupForm: ->
      $('#new_purchase').submit ->
        purchase.processCard()

    processCard: ->
      @disable_button()
      card =
        number: $('#card_number').val()
        cvc: $('#card_code').val()
        expMonth: $('#card_month').val()
        expYear: $('#card_year').val()
      Stripe.createToken(card, purchase.handleStripeResponse)

    handleStripeResponse: (status, response) ->
      if status == 200
        #a call to the server
        $.ajax
          url: 'api/purchases'
          dataType: 'json'
          data:  "cc_token=#{response.id}"
          type: 'post'
          error: (xhr, status, error) ->
            data = $.parseJSON(xhr.responseText)
            $('#stripe_error').text(data.error.message)
            purchase.enable_button()
          success: (data) ->
            $('#modal').modal('hide')
            Lunchon.purchases.removeCart()
            Lunchon.purchases.collection.reset(data)
            Lunchon.purchases.navigate("purchases", {trigger: true})
      else
        $('#stripe_error').text(response.error.message)
        purchase.enable_button()
