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
  end

  # この下に何も記述しないこと！
  private

  def post_params
    params.require(:post).permit(:post_image, :author_comment)
  end

end
