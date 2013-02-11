class Lunchon.Views.DealModal extends Backbone.View
  template: JST['deals/deal_modal']

  events:
    'click button.add_to_cart': 'addToLunchBag'

  addToLunchBag: (event) ->
    event.preventDefault()
    Lunchon.lunch_bag.addItem @model unless @model.get('remaining') == 0
    $('#modal').modal('hide')

  render: ->
    restaurant_id = @model.get('restaurant').id
    restaurant_location = Lunchon.locations.where({restaurant_id: restaurant_id})[0]
    shortestDistance = Lunchon.locations.where({restaurant_id: restaurant_id})[0]?.get('distance')?.toFixed(1)
    googleLatLng = Lunchon.locations.where({restaurant_id: restaurant_id})[0]?.get('googleLatLng')
    mapOptions =
      zoom: 14
      center: googleLatLng
      streetViewControl: false
      mapTypeControl: false
      mapTypeId: google.maps.MapTypeId.ROADMAP
    $(@el).html(@template(deal: @model, shortestDistance: shortestDistance, restaurant_location: restaurant_location))
    map = new google?.maps.Map($(@el).find('#map_canvas')[0], mapOptions)
    marker = new google.maps.Marker
      position: googleLatLng
      map: map
    map.panBy(-84,-84)
    this

