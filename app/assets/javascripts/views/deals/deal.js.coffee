class Lunchon.Views.Deal extends Backbone.View
  template: JST['deals/deal']
  tagName: 'li'
  
  events:
    'click': 'showDealModal'

  render: ->
    $(@el).html(@template(deal: @model))
    this

  showDealModal: (event) ->
    event.preventDefault()
    $this = $(@el).find('a')
    modalHtml = new Lunchon.Views.DealModal(model: @model)
    $target = $($this.data('target'))
    $target.html(modalHtml.render().el)
