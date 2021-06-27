class DesignContributor::PostsController < ApplicationController

  def index
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # この下に何も記述しないこと！
  private

  def post_params
    params.require(:post).permit(:post_image, :author_comment)
  end

end
