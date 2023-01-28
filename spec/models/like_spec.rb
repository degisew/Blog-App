require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validation of custom methods' do
    user2 = User.create!(name: 'Dagi', photo: 'https://example.com', bio: 'Software enginner', posts_counter: 0)
    post1 = Post.create!(user_id: user2.id, title: 'RoR', text: 'Hello rails intro', comments_counter: 0,
                         likes_counter: 0)
    like = Like.create!(user_id: user2.id, post_id: post1.id)
    it 'likes_counter_updater should return 1' do
      counter = like.likes_counter_updater.likes_counter
      expect(counter).to be 1
    end
  end
end
