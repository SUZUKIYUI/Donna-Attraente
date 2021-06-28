class DesignContributor::DesignContributorsController < ApplicationController

  def show
    @design_contributor = DesignContributor.find(params[:id])
  end

  def edit
    @design_contributor = DesignContributor.find(params[:id])
  end

  def update
  end

end
