// JavaScript Document
$(document).ready(function(){
  $('body').css("background-color","#6bba70");
      $(function() {
        $("#submit").click(function(){
          $('#Top').fadeOut('slow', function() {
            $(this).html("</br><h1>Thanks for Voting!</h1>").fadeIn('slow');
          });
          drawChart();
        });
        $( "#slider" ).slider({
            orientation: "vertical",
            range: "min",
            value:0,
            min: -50,
            max: 50,
            slide: function( event, ui ) {
              $("#rating").val(ui.value);
              refreshSwatch();
            },
            change: function( event, ui ) {
              $("#rating").val(ui.value);
              refreshSwatch();
            }
        });
    });
});