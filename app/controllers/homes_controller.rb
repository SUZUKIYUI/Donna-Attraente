class HomesController < ApplicationController

  def top
    @new_posts = Post.all.order(created_at: :desc).limit(12)
    @want_posts = Post.find(Want.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def about
  end

end
