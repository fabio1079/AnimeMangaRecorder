require "rails_helper"

RSpec.describe MangasController, :type => :controller do
  before :all do
    first_author = Author::create name:'Fulano'
    second_author = Author::create name:'Ciclano'

    Tag::create name:'shounen'
    Tag::create name:'shoujo'
    Tag::create name:'seinen'

    Manga::create(title:'manga A', volume:'1', chapter:'1', author:first_author)
    Manga::create(title:'manga B', volume:'2', chapter:'2', author:first_author)
    Manga::create(title:'manga C', volume:'3', chapter:'3', author:second_author)
  end

  describe "GET #index" do
    it "should load all mangas into @mangas ordered by desc" do
      mangas = Manga.order :updated_at=>:desc
      get :index

      expect(assigns(:mangas)).to match_array(mangas)
    end
  end

  describe 'GET show' do
    it 'should assign manga based on passed param' do
      last_manga = Manga.last
      get :show, :id=> last_manga.id

      expect(assigns(:manga).id).to be(last_manga.id)
    end
  end

  describe 'GET new' do
    it 'should assign a new manga' do
      get :new

      expect(assigns(:manga)).to be_a Manga
    end
  end

  describe 'POST create' do
    it 'should create a new manga with correct params' do
      post :create, manga:{
        title: 'a new manga',
        volume: '1',
        chapter: '1'
      }, author: Author.last

      expect(response).to redirect_to(assigns(:manga))
    end

    it 'should not create a new manga with incorrect params' do
      post :create, manga:{
        title: 'a new manga',
        volume: "I'm too long"
      }, author: Author.first

      expect(response).to render_template(:new)
    end
  end

  describe 'PUT update' do
    it 'should update a manga with correct params' do
      put :update, id: 2, manga:{
        title: 'a new manga title'
      }, author: Author.last, tags: [2,3,1]

      expect(response).to redirect_to(assigns(:manga))
    end

    it 'should not update a manga with incorrect params' do
      put :update, id: 2, manga:{
        title: ''
      }, author: Author.last, tags: [3]

      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE destroy' do
    it 'should delete a manga given a id' do
      delete :destroy, id: 3

      expect(response).to redirect_to(mangas_url)
    end
  end
end
