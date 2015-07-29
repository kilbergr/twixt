

// ============================================
// ==== JQUERY TO ADD A LIST FROM NAVBAR =====
// ============================================
// toggles hidden property using Jquery .toggle method


$(document).ready(function(){
$('.click-me-to-add-list').click(function(e){
		e.preventDefault();
		var $this = $(this);
		$('.hidden-list-box').toggle("slow");

	});
});
