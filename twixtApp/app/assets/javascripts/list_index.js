// ============================================
// ==== JQUERY FOR LISTS INDEX PAGE ===========
// ============================================

$(function () {

// ============================================
// =========== GLOBAL FUNCTIONS ===============
// ============================================


	function toggleScreenBlank() {
		$('.screen-blanket').toggle();
		$('.render-forms-here').toggle();
	}

	function renderAddItem() {
		var html = '<div class="new-item-form-box">' +
				        '<h3>Add a new item to your list</h3>' +
				        '<form action="/groups/:group_id/items/" class="add-item-form" method="POST">' +
				            '<div>' +
				                '<div class="item-name-label"><label for="title">Name: </div>' +
				                    '<input type="text" name="item[name]" id="name" class="add-item-form" autofocus>' +
				                '</label>' +
				            '</div>' +
				            '<div class="item-description-label"><label> Decription of Issue: </label></div>'+
				                '<div id ="item-description" class="text-box">'+    
				                        '<textarea name="item[description]" rows="5" cols="20" id="description" class="add-item-description"></textarea>' +
				                '</div>' +
				            '<div>' +
				                '<label for="uploadcare"> Upload an Image.</label>' +
				            '</div>' +
				            '<div class="image-upload-div">' +
				                '<input type="hidden" name="item[image_url]" role="uploadcare-uploader" id="uploadcare-widget" class="image-upload" />' +
				            '</div>' +                
				            '<div>' +
				                '<input type="submit" value="Create New Issue" class="add-item-submit-button">' +
				            '</div>' +
				        '</form>' +
				    '</div>';

		$(html).appendTo('.render-forms-here');
	}

	function removeAddItemForms() {
		$('.new-item-form-box').remove();
	}

// ==================================
// ==== TOGGLES FOR HIDDEN DIVS =====
// ==================================
  $('.new-list-button').click(function () {
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

	$('.close-me-button').click(function (){
		removeAddItemForms();
		toggleScreenBlank();
	})

// ======================================================
// ==== BUILD LIST ITEMS DYNAMICALLY WITH AJAX CALL =====
// ======================================================

	$('.list-toggle-box').click(function(e){
		var $this = $(this);
		var id = $this.attr('data-id');
		var listName = $this.attr('data-name');
		$.ajax({
			type: 'GET',
			url: '/lists/' + id + '/items/',
			dataType: 'json'
		}).done(function (data){
			var items = data;
			//LIST HEADER TEXT STRING
			var html= '<div class="list-item-box draggable-list", id="drag-me" data-id="'+ id +'">' +
											'<div class="list-header">' +
												'<h4 class="list-name-text">' + listName +'</h4>' +
												'<i class="add-item-icon fa fa-plus" data-id="'+ id +'""></i>' +
											'</div>'+
											'<div class="list-body">'+ 
												'<ul class="list-ul">';							
			items.forEach(function (item){
				//LIST ITEM TEXT STRING
				html += '<li class="list-li">' +
									'<div class="list-item-header">' +
										'<i class="collapse-icon fa fa-caret-square-o-down"></i>' +
										'<h7 class="list-item-name">' + item.name + '</h7>' +
										'<i class="easy-upload-button fa fa-camera"></i>' +
										'<i class="google-calendar-button fa fa-calendar"></i>' +
										'<i class="schedule-email-button fa fa-envelope-o"></i>' +
										'<i class="schedule-text-button fa fa-phone-square"></i>'	+		
									'</div>' +
									'<div class="list-item-body" id="ib">' +
									'<div class="image-div">' +
									// if item.image_url('<img src="'+ item.image_url + '" class="item-img"></div>') +
									 item.description +					
									'</div>' +
									'<div class="list-item-footer" id="if">' +
										'<i class="item-completed-button fa fa-check-square"></i>' +
										'<i class="delete-item-button fa fa-minus-square"></i>' +
									'</div>' +
								'</li>';
			
				
			});
			html += '</ul>' +
						'</div>' +
					'</div>';

		//APPEND CONCATED STRING / LIST TO DOM			
			$('.list-display').append(html);

// ==========================================
// ==== ADD .CLICK EVENTS TO LIST ICONS =====
// ==========================================
		
		//ADD NEW ITEM TO LIST
			$('.add-item-icon').click(function(e){
				toggleScreenBlank();
				renderAddItem();

			});

		//TOGGLE DESCRIPTION AND FOOTER

			$('.collapse-icon').click(function(e){	
				$(this).closest('div').toggle();
				$(this).closest('.list-item-footer').toggle();
			});

		//EASY UPLOAD BUTTON

		$('easy-upload-button').click(function(e){
			toggleScreenBlank();

		});

		//GOOGLE CALENDAR BUTTON

		$('.google-calendar-button').click(function(e){
			toggleScreenBlank();

		});

		//SCHEDULE EMAIL BUTTON

		$('.schedule-email-button').click(function(e){
			toggleScreenBlank();

		});


		//SCHEDULE TEST BUTTON

		$('.schedule-text-button').click(function(e){
			toggleScreenBlank();

		});

		//ITEM COMPLETED BUTTON

		$('.item-completed-button').click(function(e){


		});

		//ITEM COMPLETED BUTTON

		$('.delete-item-button').click(function(e){


		});


	
		


// ==========================================
// ========= LIST DRAG ANIMATIONS ===========
// ==========================================

		//DRAGABLE LIST ===NOT WORKING=== TODO: MAKEITWORK	
			$( ".list-item-box" ).sortable({
		    connectWith: ".list-item-box",
		    handle: ".list-header",
		    cancel: ".add-item-icon",
		    start: function (event, ui) {
		        ui.item.addClass('tilt');
		        tilt_direction(ui.item);
		    },
		    stop: function (event, ui) {
		        ui.item.removeClass("tilt");
		        $("html").unbind('mousemove', ui.item.data("move_handler"));
		        ui.item.removeData("move_handler");
		    }
			});
		// ADDING TILT ANIMATIONS DURING DRAG	
			function tilt_direction(item) {
		    var left_pos = item.position().left,
		      move_handler = function (e) {
		      if (e.pageX >= left_pos) {
			    	item.addClass("right");
						item.removeClass("left");
		      } else {
		      	item.addClass("left");
		        item.removeClass("right");
		      }
		        left_pos = e.pageX;
		    	};
		    $("html").bind("mousemove", move_handler);
		    item.data("move_handler", move_handler);
			}

		// ADDING JQUERY UI CLASSES	
			$( ".list-item-box" ).addClass( "draggable ui-widget ui-helper-clearfix ui-corner-all" )

		});//END OF AJAX .done CALL
	}); //END OF LIST-TOGGLE-BOX CLICK FUNCTION
	
	

	




});//END