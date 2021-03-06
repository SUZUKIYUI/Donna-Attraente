class Company::PostsController < ApplicationController

  before_action :authenticate_company!

  def index
    if Post.count > Post::POST_COUNT
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(Post::POST_COUNT)
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
      end
    end
  end

end
