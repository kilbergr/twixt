// ============================================
// ==== JQUERY FOR LISTS INDEX PAGE ===========
// ============================================


$(function(){

// ==================================
// ==== TOGGLES FOR HIDDEN DIVS =====
// ==================================
	$('.new-list-button').click(function(e){
		$('.hidden-list-box').toggle("slow");
	});

	$('.remove-list').click(function(e){
		e.stopPropagation();
		$('.hidden-remove-box').toggle("slow");
	});

	$('.cancel-button').click(function(e){
		e.stopPropagation();
		$('.hidden-remove-box').toggle("slow");
	});

// ======================================================
// ==== BUILD LIST ITEMS DYNAMICALLY WITH AJAX CALL =====
// ======================================================

	$('.list-toggle-box').click(function(e){
		var $this = $(this);
		var id = $this.attr('data-id');
		$.ajax({
			type: 'GET',
			url: '/lists/' + id + '/items/',
			dataType: 'json'
		}).done(function (data){
			var items = data;
			//LIST HEADER TEXT STRING
			htmlHead = '<div class="list-item-box", data-id="'+ 'LIST ID' +'">' +
											'<div class="list-header">' +
												'<h4 class="list-name-text">' + 'LIST NAME' +'</h4>' +
												'<i class="add-item-icon fa fa-plus"></i>' +
											'</div>';
			$('.list-display').append(htmlHead);								
			items.forEach(function (item){
				console.log(item);
				//LIST ITEM TEXT STRING
				var html = 		'<div class="list-body">' + 
												'<ul class="list-ul">' +
													'<li class="list-li">' +
														'<div class="list-item-header">' +
															'<i class="collapse-icon fa fa-caret-square-o-down"></i>' +
															'<h7 class="list-item-name">' + item.name + '</h7>' +
															'<i class="easy-upload-button fa fa-camera"></i>' +
															'<i class="google-calendar-button fa fa-calendar"></i>' +
															'<i class="schedule-email-button fa fa-envelope-o"></i>' +
															'<i class="schedule-text-button fa fa-phone-square"></i>'	+		
														'</div>' +
														'<div class="list-item-body">' +
														'<div class="image-div">' +
														// if item.image_url('<img src="'+ item.image_url + '" class="item-img"></div>') +
														 'ITEM TEXT BODY' +					
														'</div>' +
														'<div class="list-item-footer">' +
															'<i class="item-completed-button fa fa-check-square"></i>' +
															'<i class="delete-item-button fa fa-minus-square"></i>' +
														'</div>' +
													'</li>' +
												'</ul>' +
											'</div>' +
										'</div>';
				$('.list-display').append(html);
			});
					
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