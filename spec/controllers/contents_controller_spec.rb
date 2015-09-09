require 'rails_helper'

RSpec.describe ContentsController, type: :controller do
  describe 'GET #index' do
    before do
      @user = create(:user)
      @content = @user.contents.create(build(:content).attributes)
      @contents = @user.contents.all
      sign_in(@user)
    end

    it 'returns http success' do
      get :index, user_id: @user
      expect(response).to have_http_status(:success)
      expect(assigns(:contents)).to eq(@contents)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before do
      @user = create(:user)
      @content = @user.contents.create(build(:content).attributes)
      sign_in(@user)
    end

    it 'returns http success' do
      get :show, user_id: @user, id: @content
      expect(response).to have_http_status(:success)
      expect(assigns(:content)).to eq(@content)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    before do
      @user = create(:user)
      sign_in(@user)
    end

    it 'returns http success' do
      get :new, user_id: @user
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
      expect(assigns(:content)).to be_a_new(Content)
    end
  end

  describe 'POST #create' do
    before do
      @user = create(:user)
      @content = @user.contents.build(build(:content).attributes)
      sign_in(@user)
    end

    it 'creates new content' do
      expect do
        post :create, user_id: @user, content: @content.attributes
      end.to change(Content, :count).by(1)
    end
  end

  describe 'GET #edit' do
    before do
      @user = create(:user)
      @content = @user.contents.create(build(:content).attributes)
      sign_in(@user)
    end

    it 'returns http success' do
      get :edit, user_id: @user, id: @content
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
      expect(assigns(:content)).to eq(@content)
    end
  end

  describe 'PATCH #update' do
    before do
      @user = create(:user)
      @content = @user.contents.create(build(:content).attributes)
      sign_in(@user)
    end

    it 'updates content' do
      put :update, user_id: @user,
                   id: @content,
                   content: attributes_for(:content, text: 'UPDATED')
      expect(assigns(:content)).to eq(@content)
      @content.reload
      expect(@content.text).to eq('UPDATED')
      expect(response).to redirect_to(user_contents_path(user_id: @user))
    end
  end
end
