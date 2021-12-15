$(document).ready(function(){
	$("input").attr("autocomplete", "off");
	
	$('input').keydown(function(e) {
		var idx = $('input').index(this);
		
		if (e.keyCode === 13) {
			$('input').eq(idx+1).focus();
		};
	});
});