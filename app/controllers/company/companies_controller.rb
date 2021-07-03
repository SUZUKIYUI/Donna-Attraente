class Company::CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
  end

  def edit
  end

  def update
  end

end
