require 'rails_helper'

describe UsersController do
  describe 'user login' do
    before :each do
      @user = FactoryGirl.create(:user)
    end
    it 'POST#login valid user' do
      post :create_login_session, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to root_url
    end
    it 'POST#login invalid user' do
      post :create_login_session, user: FactoryGirl.attributes_for(:fake_user)
      expect(response).to render_template :login
    end
  end

  describe 'user signup' do
    it 'POST#signup successful' do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to root_url
    end
    it 'POST#signup failed' do
      post :create, user: FactoryGirl.attributes_for(:fake_user)
      expect(response).to render_template :signup
    end
  end

  describe 'user logout' do
    before :each do
      @user = FactoryGirl.create(:user)
      session[:token] = @user.token
    end

    it 'DELETE#logout' do
      delete :logout
      expect(session[:token]).to be_nil
    end
  end

end
