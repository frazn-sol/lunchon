class Lunchon.Collections.Locations extends Backbone.Collection
  url: '/api/locations'

  initialize: ->
    @.reset($('#container').data 'locations')
    navigator.geolocation.getCurrentPosition( (p) => @buildDistances(p))
    this

  buildDistances: (locationData) ->
    currentLatLng = @googleLatLng(locationData.coords.latitude, locationData.coords.longitude)
    @setDistance(locationModel, currentLatLng) for locationModel in @.models

  setDistance: (locationModel, currentLatLng) ->
    @modelSetLatLng(locationModel)
    locationModel.set(distance: @computeDistance(locationModel.get('googleLatLng'), currentLatLng))

  computeDistance: (latLng1, latLng2) ->
    google?.maps.geometry.spherical.computeDistanceBetween(latLng1, latLng2) / 1609.34 # convert to miles

  googleLatLng: (lat, lng) ->
    new google?.maps.LatLng(lat, lng)

  modelSetLatLng: (model) ->
    model.set(googleLatLng: @googleLatLng(model.get('latitude'), model.get('longitude')))
    



