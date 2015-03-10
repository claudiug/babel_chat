require 'rails_helper'

describe MessagesController do
  describe 'GET #index ' do
    it 'render the proper template' do
      get :index, nil, {username: 'foo'}
      expect(response).to render_template 'index'
    end
  end
end
