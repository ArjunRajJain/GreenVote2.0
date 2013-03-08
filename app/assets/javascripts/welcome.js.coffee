# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  rooms = $('#vote_room_id').html()
  $('#vote_building_id').change ->
  	$('#slider').parent().fadeIn()
  	building = $('#vote_building_id :selected').text()
  	escaped_building = building.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  	options = $(rooms).filter("optgroup[label='#{escaped_building}']").html()
  	if options
  		$('#vote_room_id').html(options)
  		$('#vote_room_id').parent().fadeIn()