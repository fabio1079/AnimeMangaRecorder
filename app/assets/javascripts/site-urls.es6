(function($) {
  'use strict';

  class SiteUrls {
    constructor() {
      this.$add_new_site_url_btn = $("#add-new-site-url");
      this.$invalid_pattern_error_span = $("#invalid-pattern-error");
      this.$add_url_btn = $('#add-url');
      this.$site_url_input = $('#site-url');
      this.table_row_template = $('#sites_urls_template').html();
      this.$sites_url_list_row = $("#sites-url-list");

      this.setEvents();
    }


    setEvents() {
      this.$add_new_site_url_btn.on('click', this.showNewUrlField.bind(this));
      this.$add_url_btn.on('click', this.addNewUrlToList.bind(this));

      this.setRemoveUrlEvent();
    }


    showNewUrlField() {
      this.$add_new_site_url_btn.hide();
      this.$add_url_btn.show();
      this.$site_url_input.show();
    }


    addNewUrlToList() {
      let site_url = this.$site_url_input.val().trim();
      let url_regex = new RegExp("^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$");

      if(site_url.length > 0 && url_regex.test(site_url)) {
        let new_site_row = Mustache.render(this.table_row_template, {site: site_url});

        this.$sites_url_list_row.append(new_site_row);
        this.$invalid_pattern_error_span.hide();
        this.setRemoveUrlEvent();
      } else {
        this.$invalid_pattern_error_span.show();
      }

      this.clearToNewAddition();
    }


    setRemoveUrlEvent() {
      $('.remove-url').on('click', this.removeUrlAction.bind(this));
    }


    removeUrlAction(event) {
      $(event.target).parent().parent().remove();
    }


    clearToNewAddition() {
      $('#site-url').val('');
      $('#add-url').hide();
      $('#site-url').hide();
      $("#add-new-site-url").show();
    }
  }

  window.SiteUrls = SiteUrls;
}) (jQuery);
