# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Some massive hack-feeling code ahead
# Will fix somehow sometime
initialize = ->
  mapOptions =
    zoom: 8
    center: new google.maps.LatLng(-34.397, 150.644)
    mapTypeId: google.maps.MapTypeId.ROADMAP

  window.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

$(document).ready ->
  initialize()
  window.mapClicked = false
  google.maps.event.addListener(window.map, 'click', (event) ->
    placeMarker(event.latLng)
  )

placeMarker = (location) ->
  if !window.mapClicked
    window.marker = new google.maps.Marker(
      position: location
      map: window.map
      draggable: true
    )
    $('#maid_lat').val(location.lat())
    $('#maid_lng').val(location.lng())
    window.mapClicked = true
