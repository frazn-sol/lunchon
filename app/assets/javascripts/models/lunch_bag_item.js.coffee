class Lunchon.Models.LunchBagItem extends Backbone.Model

  total_price: ->
    @.get('quantity') * @.get('original_price')
