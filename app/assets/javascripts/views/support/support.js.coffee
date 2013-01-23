class Lunchon.Views.Support extends Backbone.View
  template: JST['support/support']

  initialize: ->

  render: ->
    @$el.html(@template())
    this
