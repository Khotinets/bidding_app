// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree
//= require cloudinary 
//= require jquery.nicescroll
/*global $*/

$( document ).ready(function() {
    /* Product show - replace large image with clicked one */
    $(".product-small-image").click(function(){
        $(".product-large-image").attr("src", $(this).attr("src"));
    });
    
    /* Product show - small images scrolling */
    $(function() {  
    $(".selector").niceScroll({cursorcolor:"#dad6d6"});
});
});

