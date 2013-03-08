/*
* Author:      Marco Kuiper (http://www.marcofolio.net/)
*/

$(document).ready(function()
{
	$("#ratings li a").stop().animate({ backgroundColor : "#3bad54" } , animationTime);
	// Variable to set the duration of the animation
	var animationTime = 500;
	var changeBack = true;
	// Variable to store the colours
	var colours = ["8A0808", "e49420", "3bad54", "01DFA5", "0055bb"];

	// Add rating information box after rating
	// var ratingInfobox = $("<div />")
	// 	.attr("id", "ratinginfo")
	// 	.insertAfter($("#ratings"));

	// Function to colorize the right ratings
	var colourizeRatings = function(nrOfRatings,setBack) {
		$("#ratings li a").each(function() {
			$(this).stop().animate({ backgroundColor : "#" + colours[nrOfRatings] } , animationTime);
		});
		if(setBack){
			$('body').stop().animate({ backgroundColor : "#" + colours[nrOfRatings] } , animationTime);
		}
	};
	
	// Handle the hover events
	$("#ratings li a").hover(function() {
		
		// Empty the rating info box and fade in
		// ratingInfobox
		// 	.empty()
		// 	.stop()
		// 	.animate({ opacity : 1 }, animationTime);
		
		// Add the text to the rating info box
		// $("<p />")
		// 	.html($(this).html())
		// 	.appendTo(ratingInfobox);
		
		// Call the colourize function with the given index
		if (changeBack) {
			colourizeRatings($(this).parent().index(),false);
		}
	}, function() {
		
		// Fade out the rating information box
		// ratingInfobox
		// 	.stop()
		// 	.animate({ opacity : 0 }, animationTime);
		
		// Restore all the rating to their original colours
		if (changeBack) {
			$("#ratings li a").stop().animate({ backgroundColor : "#3bad54" } , animationTime);
		}
	});
	
	// Prevent the click event and show the rating
	$("#ratings li a").click(function(e) {
		e.preventDefault();
		colourizeRatings($(this).parent().index(),true);
		$("#rating").val(($(this).parent().index() -2)*25);
		changeBack = false;
	});
});