class DesignContributor::DesignContributorsController < ApplicationController

  def show
    @design_contributor = DesignContributor.find(params[:id])
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
