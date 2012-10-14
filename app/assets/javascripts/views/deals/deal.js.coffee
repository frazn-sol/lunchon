class Lunchon.Views.Deal extends Backbone.View
  template: JST['deals/deal']
  tagName: 'li'
  
  events:
    'click': 'showDeal'

  render: ->
    $(@el).html(@template(deal: @model))
    this

  showDeal: ->
    console.log("show deal")
    Backbone.history.navigate("deals/#{@model.get('id')}")
