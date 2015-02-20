require "rails_helper"

RSpec.describe HomeController, :type => :controller do
  it 'should set animes, mangas and tags' do
    animes = Anime.order :title
    mangas = Manga.order :title
    tags   = Tag.order :name

    get :index

    expect(assigns(:animes)).to eq(animes)
    expect(assigns(:mangas)).to eq(mangas)
    expect(assigns(:tags)).to eq(tags)
  end
end
