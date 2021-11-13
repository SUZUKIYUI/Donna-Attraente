class HomesController < ApplicationController

  def top
    # 新着のデザイン（新着順で12件まで表示）
    @new_posts = Post.all.order(created_at: :desc).limit(12)
    # 商品化希望の多いデザイン（オファー成立したものを除いて3つまで表示）
    @want_posts = Post.joins(:wants).group('wants.post_id').order('count(wants.post_id) desc').where.not(id: (Post.joins(:offers).where('offers.offer_status = 1').distinct.pluck(:id))).limit(3)
  end

  def about
  end

end
