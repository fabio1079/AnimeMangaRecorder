// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require mustache
//= require_tree .

(function() {
  "use strict";

  $("table.table-striped tbody tr").hover(
    function(){ $(this).addClass("info") },
    function(){ $(this).removeClass("info") }
  );


  $("#add-new-site-url").on('click', function() {
    $(this).hide();

    $('#add-url').show();
    $('#site-url').show();
  });


  $("#add-url").on('click', function() {
    var text = $('#site-url').val().trim();

    if(text.length) {
      var li = document.createElement('li');
      var span = document.createElement('span');
      var hidden = document.createElement('input');

      span.setAttribute('class', 'glyphicon glyphicon-minus btn btn-success remove-url');
      span.textContent = 'Remove';

      hidden.setAttribute('type', 'hidden');
      hidden.setAttribute('name', 'sites[]');
      hidden.setAttribute('value', text);

      li.textContent = text;
      li.appendChild(span);
      li.appendChild(hidden);

      $("#sites-url-list").append(li);

      $('.remove-url').on('click', remove_url_action);
    }

    $('#site-url').val('');
    $('#add-url').hide();
    $('#site-url').hide();
    $("#add-new-site-url").show();
  });

  $('.remove-url').on('click', remove_url_action);

  function remove_url_action() {
    $(this).parent().remove();
  }
} ());
