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
  $(".deal").click ->
    $.ajax
      url: "lunch_bag/get_items"
      dataType: "json"
      type: "get"
      success: (data) ->
        temp_price = $(".span4 h2").text()
        price = temp_price.slice 1, temp_price.length
        original_price = parseFloat price
        discount_1 = (10.00 * original_price)/100.00
        discount_price_1 = (original_price - discount_1).toFixed(2)
        discount_2 = (20.00 * original_price)/100.00
        discount_price_2 = (original_price - discount_2).toFixed(2)
        discount_3 = (30.00 * original_price)/100.00
        discount_price_3 = (original_price - discount_3).toFixed(2)
        discount_4 = (40.00 * original_price)/100.00
        discount_price_4 = (original_price - discount_4).toFixed(2)
        discount_5 = (50.00 * original_price)/100.00
        discount_price_5 = (original_price - discount_5).toFixed(2)
        item_number = data["total_item_count"]
        $(".span4 h2").append "<span style='color:#808080;'> Original Price</span>"
        $(".span4 h2").addClass "strikethrough"
        $(".span4 h2").after "<h5 style='margin-top: -5px;color:#808080;font-size:14px;'> $" + discount_price_1 + "<span style='color:#808080;'> if 1 Total Items in Lunch Bag </span></h5>
        <h5 style='margin-top: -15px;color:#7E7E7E;font-size:15px;'> $" + discount_price_2 + "<span style='color:#808080;'> if 2 Total Items in Lunch Bag </span></h5>
        <h5 style='margin-top: -15px;color:#595959;font-size:16px;'> $" + discount_price_3 + "<span style='color:#808080;'> if 3 Total Items in Lunch Bag</span></h5>
        <h5 style='margin-top: -15px;color:#404040;font-size:17px;'> $" + discount_price_4 + " <span style='color:#808080;'>if 4 Total Items in Lunch Bag</span></h5>
        <h5 style='margin-top: -15px; margin-bottom: 15px; margin-right:-25px;font-size:18px;'> $" + discount_price_5 + "<span style='color:#808080;'> if 5+ Total Items in Lunch Bag</span></h5>"
        return


  
