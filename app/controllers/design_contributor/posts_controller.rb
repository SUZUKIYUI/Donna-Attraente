class DesignContributor::PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.design_contributor_id = current_design_contributor.id
    if @post.save
      redirect_to design_contributor_post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    # ----------------------------
    # オファーモデルが存在するか
    if Offer.exists?
      # 交渉中のオファーが存在すれば@offerへ定義
      if Offer.where(post_id: @post.id, offer_status: "negotiation").exists?
        @offer = Offer.find_by(post_id: @post.id, offer_status: "negotiation")
      # 交渉成立オファーが存在すれば@offerへ定義
      elsif Offer.where(post_id: @post.id, offer_status: "established").exists?
        @offer = Offer.find_by(post_id: @post.id, offer_status: "established")
      # 交渉不成立オファーが存在すれば@offersへ定義
      elsif Offer.where(post_id: @post.id, offer_status: "failure").exists?
        @offers = Offer.where(post_id: @post.id, offer_status: "failure")
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to design_contributor_post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.design_contributor_id == current_design_contributor.id
      @post.destroy
      redirect_to design_contributor_posts_path
    end
  end

  # この下に何も記述しないこと！
  private

  def post_params
    params.require(:post).permit(:post_image, :author_comment)
  end

end
