class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def post_counter_updater
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
