// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require cocoon
//= require_tree .


$(document).on("turbolinks:load", function () {

    $(function() {
        $('pre').transpose();
    });

    // close the alert
    setTimeout(function() {
        $(".alert").alert('close');
    }, 4000);


    $("#song_artist_id a.add_fields").
    data("association-insertion-position", 'before').
    data("association-insertion-node", 'this');

    $('#song_artist_id').bind('cocoon:after-insert',
        function() {
            $("#song_artist_id").hide();
            $("#song_artist_id a.add_fields").hide();
        });
    $('#song_artist_id').bind("cocoon:after-remove",
        function() {
            $("#song_artist_id").show();
            $("#song_artist_id a.add_fields").show();
        });


});