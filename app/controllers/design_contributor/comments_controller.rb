class DesignContributor::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.design_contributor_id = current_design_contributor.id
    @comment.post_id = @post.id
    if @comment.save
      @post.create_notification_comment!(current_design_contributor, @comment.id, @post.design_contributor.id)
      redirect_to design_contributor_post_path(@post.id)
    else
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
