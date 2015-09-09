require 'rails_helper'

RSpec.describe ContentsController, type: :controller do
  describe 'GET #index' do
    before do
      @user = create(:user)
      sign_in(@user)
    end

    it 'returns http success' do
      get :index, user_id: @user
      expect(response).to have_http_status(:success)
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
    end
  end
end
