class Company::PostsController < ApplicationController

  def index
    if Post.count > 12
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(12)
    else
      @posts = Post.all.order(created_at: :desc)
    end
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
      # elsif Offer.where(post_id: @post.id, offer_status: :failure).exists?
      #   @offers = Offer.where(post_id: @post.id, offer_status: :failure)
      end
    end
  end

end
