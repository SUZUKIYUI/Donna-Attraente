class Company::DesignContributorsController < ApplicationController

  def show
    @design_contributor = DesignContributor.find(params[:id])
  end

end
