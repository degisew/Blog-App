require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'does not render a different template' do
      expect(response).to_not render_template('show')
    end
    it 'Should render a placeholder text' do
      user = User.create(name: 'Dagi', photo: 'https://example.com', bio: 'Software enginner', posts_counter: 0)
      post = Post.create(user_id: user.id, title: 'RoR', text: 'Hello rails intro', comments_counter: 0,
                         likes_counter: 0)
      get users_path(user, post)
      expect(response.body).to include 'Show all users'
    end
  end
end
