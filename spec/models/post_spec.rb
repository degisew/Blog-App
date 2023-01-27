require 'rails_helper'

RSpec.describe Post, type: :model do
  user2 = User.new(name: 'Dagi', photo: 'https://example.com', bio: 'Software enginner', posts_counter: 0)
  post1 = Post.create(author_id: user2, title: 'RoR', text: 'Hello rails intro', comments_counter: 0,
                      likes_counter: 0)

  describe 'validation presence' do
    it { should validate_presence_of(:title) }
  end

  describe 'validation length and numericality' do
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0) }
  end

  describe 'validation of custom methods' do
    it 'recent_five_comment should return 0' do
      #    user2 = User.new(name: 'Dagi', photo: 'https://example.com', bio: 'Software enginner', posts_counter: 0)
      #  post1 = Post.create(author: user2, title: 'RoR', text: 'Hello rails intro', comment_counter: 0,
      #                         like_counter: 0)
      expect(post1.recent_comments.size).to be 0
    end
  end
end
