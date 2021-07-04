class Company::CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_company_path(@company.id)
    else
      render :edit
    end
  end

  # この下に何も記述しないこと！
  private

  def company_params
    params.require(:company).permit(:profile_image, :company_name, :company_name_kana, :postal_code, :address, :phone_number, :email, :company_introduction)
  end

end
