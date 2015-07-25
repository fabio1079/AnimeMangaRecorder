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
    var site_url = $('#site-url').val().trim();
    var url_regex = new RegExp("^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$");

    if(site_url.length > 0 && url_regex.test(site_url)) {
      var template = $('#sites_urls_template').html();
      var rendered = Mustache.render(template, {site: site_url});

      $("#sites-url-list").append(rendered);
      $('.remove-url').on('click', remove_url_action);
    } else {
      // TODO - add invalid url message
    }

    $('#site-url').val('');
    $('#add-url').hide();
    $('#site-url').hide();
    $("#add-new-site-url").show();
  });

  $('.remove-url').on('click', remove_url_action);

  function remove_url_action() {
    $(this).parent().parent().remove();
  }
} ());
