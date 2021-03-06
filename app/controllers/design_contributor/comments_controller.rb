class DesignContributor::CommentsController < ApplicationController

  before_action :authenticate_design_contributor!

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.design_contributor_id = current_design_contributor.id
    @comment.post_id = @post.id
    if @comment.save
      @post.create_notification_comment!(current_design_contributor, @comment.id, @post.design_contributor.id)
      redirect_to design_contributor_post_path(@post.id)
    else
    # オファーモデルが存在するか
      if Offer.exists?
        # 交渉中のオファーが存在すれば@offerへ定義
        if Offer.where(post_id: @post.id, offer_status: :negotiation).exists?
          @offer = Offer.find_by(post_id: @post.id, offer_status: :negotiation)
        # 交渉成立オファーが存在すれば@offerへ定義
        elsif Offer.where(post_id: @post.id, offer_status: :established).exists?
          @offer = Offer.find_by(post_id: @post.id, offer_status: :established)
        # 交渉不成立オファーが存在すれば@offersへ定義
        # elsif Offer.where(post_id: @post.id, offer_status: "failure").exists?
        #   @offers = Offer.where(post_id: @post.id, offer_status: "failure")
        end
      end
      render template: "design_contributor/posts/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if @comment.design_contributor_id == current_design_contributor.id
      @comment.destroy
      redirect_to design_contributor_post_path(@post.id)
    end
  end

  # この下に何も記述しないこと！
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
