class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def likes_counter_updater
    post.increment!(:likes_counter)
  end
end
