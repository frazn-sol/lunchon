window.Lunchon =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    @deals = new Lunchon.Routers.Deals
    @purchases = new Lunchon.Routers.Purchases
    @support = new Lunchon.Routers.Support
    @lunch_bag = new Lunchon.Models.LunchBag
    @buy_button = new Lunchon.Models.BuyButton
    @locations = new Lunchon.Collections.Locations

    @show_flash = (message) ->
      flash_row = $('.row.flash')
      flash_row.empty()
      flash_close_button = $('<button>').addClass('close').attr('data-dismiss', 'alert').append("&times;")
      flash_message_container = $('<p>').attr('id', 'notice').text(message)
      flash_container = $('<div>').addClass('span9 alert').attr('id', 'notice').hide()
      flash_container.append(flash_close_button)
      flash_container.append(flash_message_container)
      flash_row.append(flash_container).alert()
      flash_container.fadeIn(700)

    Backbone.history.start()

$(document).ready ->
  Lunchon.init()


  
