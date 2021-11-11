class HomesController < ApplicationController

  def top
    @new_posts = Post.all.order(created_at: :desc).limit(12)
    target_post_ids = Post.joins(:offers).where('not offers.offer_status = 1').distinct.pluck(:id)
    @want_posts = Post.joins(:wants).where(id: target_post_ids).group('wants.post_id').order('count(wants.post_id) desc').limit(3)

  end

  def about
  end

end
