require 'rails_helper'

describe MessagesController do
  it 'render the proper template' do
    get :index, nil, {username: 'foo', content: 'foo'}
    expect(response).to render_template 'index'
  end

  it 'change the language' do
    %w(yoda pirate binary valley).each do |el|
      post :change_language, nil, type: el
      expect(session[:type]).to eq el
    end
  end
end
