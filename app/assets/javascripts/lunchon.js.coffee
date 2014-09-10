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
  if current_width <= 450  
    $("body").css("overflow-y":"auto") 
    $(".how-col").css("width":"140%", "margin-top": "23px", "margin-left": "-10px")
    $(".how-logo").css("width":"100%", "padding-bottom":"115px", "padding-top":"31px")
    $(".how-works").css("font-size":"94%", "margin-top": "-30px", "width": "150%", "margin-left": "-58px")
    $(".meal-listing span").css("padding-left":"0px", "font-weight": "bolder", "font-size": "130%", "text-decoration": "underline")
    $(".meal-listing").css("text-align":"center")
    $(".social-icons").css("width":"65%", "float":"none")
    $(".signup-popup").css("float":"left", "margin-left": "-31px")
    $(".email-login").css("margin-top":"20px")
    $(".sign-up-logo").css("width":"95%")
    $(".signin-logo").css("padding-top":"31px")
    $(".devise-links").css("float":"left", "width":"140%")
    $(".works-left").css("display":"none")
    $(".email-text").css("width":"100%")
    $(".email-form").css("width":"100%")
    $(".popup-logo").css("width":"100%")
    $(".signin-fields").css("width":"130%", "margin-top":"30px")
    $(".signin-button").css("float":"none")
    $(".signup-social").css("width":"210%")
    $(".signin-popup").css("margin-top": "75px", "width":"136%", "float": "left", "margin-left":"-45px")
    $( ".meal-listing span" ).text("How it works")
  if current_width > 450 && current_width <= 700
    $("body").css("overflow-y":"auto") 
    $(".how-col").css("width":"100%")
    $(".how-logo").css("width":"100%", "padding-bottom":"115px", "padding-top":"31px")
    $(".how-works").css("font-size":"94%", "margin-top": "-30px", "width": "150%", "margin-left": "-58px")
    $(".meal-listing span").css("padding-left":"0px", "font-weight": "bolder", "font-size": "130%", "text-decoration": "underline")
    $(".meal-listing").css("text-align":"center")
    $(".social-icons").css("width":"65%", "float":"none")
    $(".signup-popup").css("float":"left", "width":"132%")
    $(".email-login").css("margin-top":"20px")
    $(".sign-up-logo").css("width":"95%")
    $(".signin-logo").css("padding-top":"31px")
    $(".devise-links").css("float":"none")
    $(".works-left").css("display":"none")
    $(".email-text").css("width":"100%")
    $(".email-form").css("width":"100%")
    $(".popup-logo").css("width":"100%")
    $(".signin-fields").css("width":"100%")
    $(".signin-popup").css("margin-top": "75px", "float": "left", "margin-left":"-45px")
    $( ".meal-listing span" ).text("How it works")
  if current_width > 700 && current_width < 1025
    $("body").css("overflow-y":"auto")   
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
