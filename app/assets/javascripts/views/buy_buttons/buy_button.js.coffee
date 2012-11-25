class Lunchon.Views.BuyButton extends Backbone.View
  template: JST['buy_buttons/buy_button']

  events:
      'click a.buy': 'showPurchaseModal'

  render: ->
    $(@el).html(@template(is_user_signed_in: @model.get('is_user_signed_in')))
    this

  showPurchaseModal: (event) ->
    event.preventDefault()
    $this = $(@el).find('a')
    modalHtml = new Lunchon.Views.BuyButtonModal()
    $target = $($this.data('target'))
    $target.html(modalHtml.render().el)
    
