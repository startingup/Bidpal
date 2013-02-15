# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {
    // get data every 5 seconds and refresh myDiv
    var pingAfter = 5000;  
    var refreshId = setInterval(function() {
        $("#TextEdit").load('/bidding');
    }, pingAfter);
});
