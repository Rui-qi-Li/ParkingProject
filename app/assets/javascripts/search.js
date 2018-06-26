
// function myMap() {
//   //init map
//   var map = new google.maps.Map(document.getElementById("googleMap"),{zoom:13});
//   //get current position
//   if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(function(position) {
//       var pos = {
//           lat: position.coords.latitude,
//           lng: position.coords.longitude
//       };
//       map.setCenter(pos);
//     });
//   }
// }
//autocomplete library
function myAutocomplate() {
  var ac = new google.maps.places.Autocomplete(document.getElementById("search"),{
      componentRestrictions: {country:'ie'}
  });
  google.maps.event.addListener(ac,'place_changed',function(){
    var place = ac.getPlace();
    var address = place.formatted_address;
    var lat = place.geometry.location.lat();
    var lng = place.geometry.location.lng();
    //console.log(address);
    //get lat(), lng()
    var search = {
      address:address,
      lat:lat,
      lng:lng
    }
    var url = $.param({search:search})
    // Assigns a new URL to the current window.
    window.location.assign('/parking?'+url);

    // var test = $('#search').val($.param({search:search}));
    // console.log(test)
    // $('form').submit();
    // $.getJSON('/parking',{search:search},function(res){
    //   console.log(res);
    // })
  });
}

function initMap(){
  // myMap();
  myAutocomplate();
}
