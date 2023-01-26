class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def comments_counter_updater
    post.increment!(:comments_counter)
  end
end
