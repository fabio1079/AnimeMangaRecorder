require "rails_helper"

RSpec.describe Anime, :type => :model do
  before(:each) do
    @anime = Anime::create(
      :title=>"sample anime title",
      :season=>"1",
      :season_title=>"sample anime season",
      :episode=>"sample anime episode"
    )
  end

  it "should has friendly urls" do
    expect(@anime.slug).to eq("sample-anime-title")
  end

  it "should update its friendly urls" do
    @anime.title = "a new title and url"
    @anime.save!

    expect(@anime.slug).to eq("a-new-title-and-url")
  end

  it "should verify its sites urls" do
    @anime.sites << "google.com"
    @anime.sites << "i'm not an url"

    expect(@anime.save).to eq(false)

    errors = @anime.errors.messages

    expect(errors[:sites]).to include("Invalid url: i'm not an url")
    expect(errors[:sites]).to_not include("Invalid url: google.com")
  end
end