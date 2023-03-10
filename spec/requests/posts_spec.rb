require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'posts' do
    user = User.create(name: 'Momo', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
    before(:example) { get user_posts_path(user) }
    it 'Should return render index template' do
      expect(response).to render_template('index')
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'does not render a different template' do
      expect(response).to_not render_template('show')
    end
    it 'Should render a placeholder text' do
      user = User.create(name: 'Dagi', photo: 'https://example.com', bio: 'Software enginner', posts_counter: 0)
      post = Post.create(user_id: user.id, title: 'RoR', text: 'Hello rails intro', comments_counter: 0,
                         likes_counter: 0)
      get user_posts_path(user, post)
      expect(response.body).to include 'all posts for a specific user'
    end
  end
end
