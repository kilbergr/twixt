$(function(){
$('.click-me-to-add-group').click(function(e){
		e.preventDefault();
		var $this = $(this);
		$('.hidden-new-group-box').toggle("slow");

	});


});
