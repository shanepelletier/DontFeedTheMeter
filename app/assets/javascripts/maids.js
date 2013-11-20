var googlemap;
var MaidsController = Paloma.controller('Maids');

MaidsController.prototype.index = function() {
  // Display map with all meter maids marked
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(-34.397, 150.644),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  googlemap = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  for (var i = 0; i < this.params['maids'].length; i++) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(this.params['maids'][i].lat, this.params['maids'][i].lng),
      map: googlemap
    });
  }
}

MaidsController.prototype.new = function() {
  // Display map with marker
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(-34.397, 150.644),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  googlemap = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  
  var mapClicked = false;

  google.maps.event.addListener(googlemap, 'click', function(event) {
    if (!mapClicked) {
      var marker = new google.maps.Marker({
        position: event.latLng,
        map: googlemap,
        draggable: true  
      });
      
      mapClicked = true;

      $('#maid_lat').val(event.latLng.lat());
      $('#maid_lng').val(event.latLng.lng());
    }
  });
}
