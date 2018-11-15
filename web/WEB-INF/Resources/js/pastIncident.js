/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function initAutocomplete() {
    
   var lat = $("#lat").val();
   var long = $("#long").val();
  
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: lat, lng: long},
    zoom: 14,
    mapTypeId: 'roadmap'
  });
  
  
  var myMarker = new google.maps.Marker({
      position: new google.maps.LatLng( lat,long),
      draggable: false
  });
  
  
  
  google.maps.event.addListener(myMarker, 'dragend', function(evt){
     $("#lat").val(evt.latLng.lat().toFixed(3));
     $("#long").val(evt.latLng.lng().toFixed(3));
     console.log(evt.latLng.lat().toFixed(3));
  });
  
  map.setCenter(myMarker.position);
  myMarker.setMap(map);
  
  // Create the search box and link it to the UI element.
  var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  // Bias the SearchBox results towards current map's viewport.
  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });
  
  

  var markers = [];
  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }

    // Clear out the old markers.
    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      if (!place.geometry) {
        console.log("Returned place contains no geometry");
        return;
      }
      var icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      // Create a marker for each place.
      markers.push(new google.maps.Marker({
        map: map,
        icon: icon,
        title: place.name,
        position: place.geometry.location
      }));

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
  });
  
  
  //Map for routes. Second tab
  var mapRoutes = new google.maps.Map(document.getElementById('mapRoutes'),{
        center: {lat: 19.2400444, lng: -103.7636274},
        zoom: 14,
        mapTypeId: 'roadmap'
    })
    
}