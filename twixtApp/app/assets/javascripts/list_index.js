$(function(){

	$('.new-list-button').click(function(e){
		alert("AHHH - JAVASCRIPT");
	});

	$('.list-toggle-box').click(function(e){
		var $this = $(this);
		var id = $this.attr('data-id');
		$.ajax({
			type: 'GET',
			url: '/lists/' + id + '/items/',
			dataType: 'json'
		}).done(function (data){
			console.log(data);
		});
	});


	// $('#form-control').submit(function (e) {
 //      e.preventDefault();

 //      var name = $('#name').val();
 //      var address = $('#address').val();
 //      var lat = $('#lat').val();
 //      var long = $('#long').val();

 //      var data = {place: {name: name, address: address, lat: lat, long: long}};

 //      $.ajax({
 //        type: 'POST',
 //        url: '/places',
 //        data: data,
 //        dataType: 'json',
 //      }).done(function (data) {
 //        var html = tableHtml(data.place);
 //        $(html).prependTo('tbody');

 //          var lat = data.place.lat;
 //          var long = data.place.long;
 //          var myLatlng = new google.maps.LatLng(lat,long);

 //          var marker = new google.maps.Marker({
 //            position: myLatlng,
 //            map: map,
 //            animation: google.maps.Animation.DROP,
 //            title: data.place.name
 //          })
 //      });
 //  });   







});