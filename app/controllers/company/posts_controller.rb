class Company::PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    # ----------------------------
    # オファーモデルが存在するか
    if Offer.exists?
      # 交渉中のオファーが存在すれば@offerへ定義
      if Offer.where(post_id: @post.id, offer_status: :negotiation).exists?
        @offer = Offer.find_by(post_id: @post.id, offer_status: :negotiation)
      # 交渉成立オファーが存在すれば@offerへ定義
      elsif Offer.where(post_id: @post.id, offer_status: :established).exists?
        @offer = Offer.find_by(post_id: @post.id, offer_status: :established)
      # 交渉不成立オファーが存在すれば@offersへ定義
      elsif Offer.where(post_id: @post.id, offer_status: :failure).exists?
        @offers = Offer.where(post_id: @post.id, offer_status: :failure)
      end
    end
  end

end
