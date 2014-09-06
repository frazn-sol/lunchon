// JavaScript Document
$( document ).ready(function() {
	// $( "#show-popup" ).click(function() {
	// 	$( ".overlay" ).show();
	// 	$( ".main" ).show();
	// });
	$( ".close-btn" ).click(function() {
		//$( ".main" ).fadeOut();
		var id = $(this).attr('id');
		if (id != "sign-up-close"){
			$(".sign-up-popup").hide();
			$( ".main" ).hide("slide", { direction: "left" }, 500);
			$( ".modal-backdrop" ).hide();
		}
		else{
			$( ".main" ).hide("slide", { direction: "left" }, 500);
			$(".how-it-works-popup").show();
			$( ".how-it" ).show("slide", { direction: "left" }, 500);
		}
	});
});

