class DesignContributor::WantsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    Want.create(design_contributor_id: current_design_contributor.id, post_id: @post.id)
    redirect_to design_contributor_post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    Want.find_by(design_contributor_id: current_design_contributor.id, post_id: @post.id).destroy
    redirect_to design_contributor_post_path(@post.id)
  end

end
