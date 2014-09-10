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
  $(".how-it-works-popup").hide()
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
        $(".span4 h2").append "<span style='color:#808080; font-weight:normal; font-size:15px;'> Original Price</span>"
        $(".span4 h2").addClass "strikethrough"
        $(".span4 h2").after "<h5 style='margin-top: -18px;color:#808080;font-size:13px; margin-right:-25px;'> $" + discount_price_1 + "<span style='color:#808080; font-size:11px; font-weight:normal;'> if <b style='color:black;'>1</b> Total Items in Lunch Bag </span></h5>

        <h5 style='margin-top: -15px;color:#7E7E7E;font-size:13px; margin-right:-25px;'> $" + discount_price_2 + "<span style='color:#808080; font-size:11px; font-weight:normal;'> if <b style='color:black;'>2</b> Total Items in Lunch Bag </span></h5>

        <h5 style='margin-top: -15px;color:#595959;font-size:13px; margin-right:-25px;'> $" + discount_price_3 + "<span style='color:#808080; font-size:11px; font-weight:normal;'> if <b style='color:black;'>3</b> Total Items in Lunch Bag</span></h5>

        <h5 style='margin-top: -15px;color:#404040;font-size:13px; margin-right:-25px;'> $" + discount_price_4 + " <span style='color:#808080; font-size:11px; font-weight:normal;'>if <b style='color:black;'>4</b> Total Items in Lunch Bag</span></h5>

        <h5 style='margin-top: -15px; margin-bottom: 15px; margin-right:-25px;font-size:13px;'> $" + discount_price_5 + "<span style='color:#808080; font-size:11px; font-weight:normal;'> if <b style='color:black;'>5+</b> Total Items in Lunch Bag</span></h5>"
        return

  current_width = $(window).width()

  #do something with the width value here!
  if current_width < 1050
    $(".modal").addClass("wide-popup")
  if current_width < 450  
    $("body").css("overflow-y":"auto") 
    $(".how-col").css("width":"100%")
    $(".how-logo").css("width":"100%", "padding-bottom":"115px")
    $(".how-works").css("font-size":"80%")
    $(".works-left h1").css("font-size":"75%");
    $(".meal-listing span").css("padding-left":"0px");
    $(".social-icons").css("width":"65%", "float":"none")
    $(".signup-popup").css("float":"left", "width":"132%")
    $(".email-login").css("margin-top":"20px")
    $(".sign-up-logo").css("width":"95%")
    $(".devise-links").css("float":"none")
  if current_width > 450 && current_width <= 500
    $("body").css("overflow-y":"auto") 
    $(".how-col").css("width":"100%")
    $(".how-logo").css("width":"100%", "padding-bottom":"115px")
    $(".how-works").css("font-size":"80%")
    $(".works-left h1").css("font-size":"75%");
    $(".meal-listing span").css("padding-left":"0px");
    $(".social-icons").css("width":"65%", "float":"none")
    $(".signup-popup").css("float":"left", "width":"132%")
    $(".email-login").css("margin-top":"20px")
    $(".sign-up-logo").css("width":"95%")
    $(".devise-links").css("float":"none")
  if current_width > 500 && current_width < 1025   
    $(".how-col").css("width":"52%")
    $(".how-logo").css("width":"48%")
    $(".how-works").css("font-size":"80%")
    $(".works-left h1").css("font-size":"75%");
    $(".meal-listing span").css("padding-left":"0px");
    $(".social").css("width":"155%")
    $(".social-icons").css("width":"50%", "float":"none")
    $(".signup-popup").css("float":"right")
    $(".email-login").css("margin-top":"20px")
    $(".sign-up-logo").css("width":"48%")
if window.location.hash is "#_=_"
  window.location.hash = "" # for older browsers, leaves a # behind
  history.pushState "", document.title, window.location.pathname # nice and clean
  e.preventDefault() # no page reload
