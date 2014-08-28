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
$('#cart.span3').qtip({ // Grab some elements to apply the tooltip to
    content: {
    	title: 'Lunch Bag',
        text: '<p>All the items and discount prices can be seen here</p>',
        button: true
    },
    show: {
        ready: true,
        when: false
    },
    hide: {
      event: 'mouseenter hover',	
      when:false
    },
    position: {
        my: 'right top',  // Position my top left...
        at: 'center left', // at the bottom right of...
        target: $('#cart.span3') // my target
    }
});

$('#how-tooltip').qtip({ // Grab some elements to apply the tooltip to
    content: {
    	title: 'How it works',
        text: '<p>Buy 1 Meal - Get 10% of Each Meal <br/> Buy 2 Meal - Get 20% of Each Meal<br/> Buy 3 Meal - Get 30% of Each Meal<br/> Buy 4 Meal - Get 40% of Each Meal<br/> Buy 5 Meal - Get 50% of Each Meal </p>',
        button: true
    },
    show: {
        ready: true,
        when: false
    },
    hide: {
      event: 'mouseenter hover',	
      when:false
    },
    position: {
        my: 'right top',  // Position my top left...
        at: 'bottom left', // at the bottom right of...
        target: $('#how-tooltip') // my target
    }
});

});

