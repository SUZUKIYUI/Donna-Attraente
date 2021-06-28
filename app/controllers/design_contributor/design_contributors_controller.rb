class DesignContributor::DesignContributorsController < ApplicationController

  def show
    @design_contributor = DesignContributor.find(params[:id])
  end

  def edit
  end

  def update
  end

end
