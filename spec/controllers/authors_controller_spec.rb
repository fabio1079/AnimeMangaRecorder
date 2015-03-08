require "rails_helper"

RSpec.describe AuthorsController, :type => :controller do
  before :all do
    Author::create name:'Fulano'
    Author::create name:'Ciclano'
  end

  describe "GET #index" do
    it "should load all authors into @authors ordered by desc" do
      authors = Author.order :updated_at=>:desc
      get :index

      expect(assigns(:authors)).to match_array(authors)
    end
  end

  describe 'GET show' do
    it 'should assign author based on passed param' do
      author_last = Author.last
      get :show, :id=> author_last.id

      expect(assigns(:author).id).to be(author_last.id)
    end
  end

  describe 'GET new' do
    it 'should assign a new author' do
      get :new

      expect(assigns(:author)).to be_a Author
    end
  end

  describe 'POST create' do
    it 'should create a new author with correct params' do
      post :create, author:{
        name: 'A new name'
      }

      expect(response).to redirect_to(assigns(:author))
    end

    it 'should not create a new author with incorrect params' do
      post :create, author:{
        name: '!'
      }

      expect(response).to render_template(:new)
    end
  end

  describe 'PUT update' do
    it 'should update an author with correct params' do
      put :update, id: 2, author:{
        name: 'Another name'
      }

      expect(response).to redirect_to(assigns(:author))
    end

    it 'should not update an author with incorrect params' do
      put :update, id: 2, author:{
        name: '!'
      }

      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE destroy' do
    it 'should delete an author given a id' do
      delete :destroy, id: 1

      expect(response).to redirect_to(authors_url)
    end
  end
end
