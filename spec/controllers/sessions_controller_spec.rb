require 'rails_helper'

describe SessionsController do
  describe 'GET #new ' do
    it 'render the proper template' do
      get :new
      expect(response).to render_template 'new'
    end
  end

  describe 'POST #create' do
    it 'redirect to messages controller with valid data' do
      post :create, user: attributes_for(:user)
      expect(response).to redirect_to messages_path
    end

    it 'render new template when validation fails' do
      post :create, user: attributes_for(:user, username: nil)
      expect(response).to render_template 'new'
    end
  end
end
