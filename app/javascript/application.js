// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//= require jquery
//= require jquery_ujs

$(document).ready(function() {

    // #first_select is the id of our first select box, if the ajax request has been successful,
    // an ajax:success event is triggered.
  
    $('#first_select').live('ajax:success', function(evt, data, status, xhr) {
      // get second selectbox by its id
      var selectbox2 = $('#second_select');
  
      // empty it
      selectbox2.empty();
  
      // we got a JSON array in data, iterate through it
  
      $.each(data, function(index, value) {
        // append an option
        var opt = $('<option/>');
  
        // value is an array: [:id, :name]
        opt.attr('value', value[0]);
        // set text
        opt.text(value[1]);
        // append to select
        opt.appendTo(selectbox2);
      });
    });
  
  });