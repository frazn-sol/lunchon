$(function(){
	var pathname = window.location.pathname;
	if (pathname==="/admin/deals/new"){
		$( "#deal_description_input" ).after( "<li class='text input optional' id='deal_code_input'><label class=' label' for='deal_code_button'>Add Code</label><button type='button' id='add_code'>Add Code</button></li>" );
	}
	var count=1;
	$( "#add_code" ).click(function() {
  		$( "#deal_code_input" ).before( "<li class='string input required stringish' id='deal_code_input_"+count+"'><label class='label' for='deal_code_field'>Code<abbr title='required'>*</abbr></label><input id='deal_code_"+count+"' maxlength='255' name='deal[code][code_"+count+"]' type='text'></li>" );	
		count++;
	});
});