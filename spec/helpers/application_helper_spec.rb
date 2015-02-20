require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do
  include ApplicationHelper

  describe "menu_link" do
    it "should include 'active' on link if it is the current page controller" do
      params[:controller] = 'anime'
      link = menu_link 'Anime', 'anime'

      expect(link).to include('active')
    end

    it "should not include 'active' on link if it is not the current page controller" do
      params[:controller] = 'manga'
      link = menu_link 'Anime', 'anime'

      expect(link).to_not include('active')
    end
  end
end
