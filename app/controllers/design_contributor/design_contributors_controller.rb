class DesignContributor::DesignContributorsController < ApplicationController

  before_action :authenticate_design_contributor!, only: [:edit, :update]

  def show
    @design_contributor = DesignContributor.find(params[:id])
    if Post.count > 12
      @posts = Post.where(design_contributor_id: @design_contributor.id).all.order(created_at: :desc).page(params[:page]).per(12)
    else
      @posts = Post.where(design_contributor_id: @design_contributor.id).all.order(created_at: :desc)
    end
  end

  def edit
    @design_contributor = DesignContributor.find(params[:id])
  end

  def update
    @design_contributor = DesignContributor.find(params[:id])
    if @design_contributor.update(design_contributor_params)
      redirect_to design_contributor_design_contributor_path(@design_contributor.id)
    else
      render :edit
    end
  end

  # この下に何も記述しないこと！
  private

  def design_contributor_params
    params.require(:design_contributor).permit(:profile_image, :pen_name, :email, :self_introduction)
  end

end
