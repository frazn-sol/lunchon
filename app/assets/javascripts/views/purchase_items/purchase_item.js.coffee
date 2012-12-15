class Lunchon.Views.PurchaseItem extends Backbone.View
  template: JST['purchase_items/purchase_item']
  tagName: 'li'
  className: 'purchase_item'

  model: Lunchon.Models.PurchaseItem

  events:
    'click button.generate_redemption': 'generateRedemption'

  generateRedemption: (event) ->
    event.preventDefault()
    $this = $(@el).find('button')
    redemption = new Lunchon.Models.Redemption purchase_item_id: @model.get('id')
    redemption.save {},
      success: (model,response) ->
        modalHtml = new Lunchon.Views.RedemptionModal(model: model)
        $target = $($this.data('target'))
        $target.html(modalHtml.render().el)
      error: (model,response) ->

  render: ->
    @$el.html(@template(purchase_item: @model))
    this


