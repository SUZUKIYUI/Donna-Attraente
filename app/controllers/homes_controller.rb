class HomesController < ApplicationController

  def top
    @new_posts = Post.all.order(created_at: :desc).limit(12)
  end

  def about
  end

end
