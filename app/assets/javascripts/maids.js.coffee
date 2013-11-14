# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
initialize = ->
  mapOptions =
    zoom: 8
    center: new google.maps.LatLng(-34.397, 150.644)
    mapTypeId: google.maps.MapTypeId.ROADMAP

  window.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

$(document).ready ->
  initialize()
  google.maps.event.addListener(window.map, 'click', (event) ->
    placeMarker(event.latLng)
  )

placeMarker = (location) ->
  marker = new google.maps.Marker(
    position: location
    map: window.map
  )
