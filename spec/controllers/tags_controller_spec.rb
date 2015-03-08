require "rails_helper"

RSpec.describe TagsController, :type => :controller do
  before :all do
    Tag::create name:'shounen'
    Tag::create name:'shoujo'
  end

  describe "GET #index" do
    it "should load all tags into @tags ordered by desc" do
      tags = Tag.order :name
      get :index

      expect(assigns(:tags)).to match_array(tags)
    end
  end

  describe 'GET show' do
    it 'should assign tag based on passed param' do
      last_tag = Tag.last
      get :show, :id=> last_tag.id

      expect(assigns(:tag).id).to be(last_tag.id)
    end
  end

  describe 'GET new' do
    it 'should assign a new tag' do
      get :new

      expect(assigns(:tag)).to be_a Tag
    end
  end

  describe 'POST create' do
    it 'should create a new tag with correct params' do
      post :create, tag:{
        name: 'Fantasy'
      }

      expect(response).to redirect_to(assigns(:tag))
    end

    it 'should not create a new tag with incorrect params' do
      post :create, tag:{
        name: 'T'
      }

      expect(response).to render_template(:new)
    end
  end

  describe 'PUT update' do
    it 'should update a tag with correct params' do
      put :update, id: 2, tag:{
        name: 'A new tag name'
      }

      expect(response).to redirect_to(assigns(:tag))
    end

    it 'should not update a tag with incorrect params' do
      put :update, id: 2, tag:{
        name: '?'
      }

      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE destroy' do
    it 'should delete a tag given a id' do
      delete :destroy, id: 1

      expect(response).to redirect_to(tags_url)
    end
  end
end
