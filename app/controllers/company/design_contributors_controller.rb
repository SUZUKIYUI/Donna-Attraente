class Company::DesignContributorsController < ApplicationController

  before_action :authenticate_company!

  def show
    @design_contributor = DesignContributor.find(params[:id])
  end

end
