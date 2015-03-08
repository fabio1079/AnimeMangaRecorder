require "rails_helper"

RSpec.describe AnimesController, :type => :controller do
  before :all do
    first_author = Author::create name:'Fulano'
    second_author = Author::create name:'Ciclano'

    Tag::create name:'shounen'
    Tag::create name:'shoujo'
    Tag::create name:'seinen'

    Anime::create(title:'anime A', season:'1', episode:'1', author:first_author)
    Anime::create(title:'anime B', season:'2', episode:'2', author:first_author)
    Anime::create(title:'anime C', season:'3', episode:'3', author:second_author)
  end

  describe "GET #index" do
    it "should load all animes into @animes ordered by desc" do
      animes = Anime.order :updated_at=>:desc
      get :index

      expect(assigns(:animes)).to match_array(animes)
    end
  end

  describe 'GET show' do
    it 'should assign anime based on passed param' do
      last_anime = Anime.last
      get :show, :id=> last_anime.id

      expect(assigns(:anime).id).to be(last_anime.id)
    end
  end

  describe 'GET new' do
    it 'should assign a new anime' do
      get :new

      expect(assigns(:anime)).to be_a Anime
    end
  end

  describe 'POST create' do
    it 'should create a new anime with correct params' do
      post :create, anime:{
        title: 'a new anime',
        season: '1',
        episode: '1'
      }, author: Author.last

      expect(response).to redirect_to(assigns(:anime))
    end

    it 'should not create a new anime with incorrect params' do
      post :create, anime:{
        title: 'a new anime',
        season: "I'm too long"
      }, author: Author.first

      expect(response).to render_template(:new)
    end
  end

  describe 'PUT update' do
    it 'should update an anime with correct params' do
      put :update, id: 2, anime:{
        title: 'a new anime title'
      }, author: Author.last, tags: [1,2,3]

      expect(response).to redirect_to(assigns(:anime))
    end

    it 'should not update an anime with incorrect params' do
      put :update, id: 2, anime:{
        title: ''
      }, author: Author.last, tags: [1,2,3]

      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE destroy' do
    it 'should delete an anime given a id' do
      delete :destroy, id: 1

      expect(response).to redirect_to(animes_url)
    end
  end
end
