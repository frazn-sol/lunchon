# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("a.deal_modal").click (e) ->
    $this = $(@)
    $target = $($this.data('target'))
    $target.load($this.attr('href'), setupCart)
  setupCart = ->
    $('div.modal a.add_to_cart').bind('click', addToCart)
  addToCart = ($target) ->
    $this = $(this)
    url = $this.data('url')
    console.log(url)
    $.ajax
      url: url
      type: 'POST'
      dataType: 'json'
      success: (data) ->
        console.log(data)
        $('div.modal').modal('hide')
