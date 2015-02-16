require "rails_helper"

RSpec.describe AnimesController, :type => :controller do
  before(:each) do
    Anime::create(:title=>"anime A", :season=>"1", :episode=>"1")
    Anime::create(:title=>"anime B", :season=>"2", :episode=>"2")
    Anime::create(:title=>"anime C", :season=>"3", :episode=>"3")
  end

  describe "GET #index" do
    it "should load all animes into @animes ordered by desc" do
      animes = Anime.order :updated_at=>:desc
      get :index

      expect(assigns(:animes)).to match_array(animes)
    end
  end
end
