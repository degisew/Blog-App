require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(photo: 'http://example.com', bio: 'software enginner', posts_counter: 0)
  before { user.save }


  describe 'validation of presense' do
    it do
      should validate_presence_of(:name)
    end
  end
  describe 'validation of numericality' do
    it do
      should validate_numericality_of(:posts_counter).is_greater_than_or_equal_to(0)
    end
  end
  describe 'validation of custom method' do
    it 'recent_post should return 1' do
      user2 = User.create(name: 'Mahi', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
      Post.create(author_id: user2.id, title: 'Rails intro', text: 'Hello rails intro', comments_counter: 2,
                  likes_counter: 0)
      expect(user2.recent_post.size).to be 0
    end
  end
end
