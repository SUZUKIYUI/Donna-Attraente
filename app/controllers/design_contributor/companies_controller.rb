class DesignContributor::CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    
  end

end
