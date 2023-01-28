require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validation presence' do
    it { should validate_presence_of(:title) }
  end

  describe 'validation length and numericality' do
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0) }
  end

  describe 'validation of custom methods' do
    user2 = User.create(name: 'Dagi', photo: 'https://example.com', bio: 'Software enginner', posts_counter: 0)
    post1 = Post.create(user_id: user2.id, title: 'RoR', text: 'Hello rails intro', comments_counter: 0,
                        likes_counter: 0)
    it 'recent_five_comment should return 0' do
      expect(post1.recent_comments.size).to be 0
    end
    it 'post_counter_updater should return 1' do
      counter = post1.post_counter_updater.posts_counter
      expect(counter).to be 2
    end
  end
end
