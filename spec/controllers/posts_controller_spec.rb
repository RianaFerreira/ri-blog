require 'spec_helper'

describe PostsController do
  describe 'GET #list' do
    before { get :index }
    it { should render_template('index') }
  end

  describe 'GET #show' do
    before { get :show }
    xit { should render_template('show') }
  end

end
