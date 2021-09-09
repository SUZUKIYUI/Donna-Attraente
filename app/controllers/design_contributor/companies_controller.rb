class DesignContributor::CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    # ----------------------------------
    if Offer.exists?
      # 交渉成立オファーが存在すれば@offersへ定義
      if Offer.where(company_id: @company.id, offer_status: :established).exists?
        @offers = Offer.where(company_id: @company.id, offer_status: :established)
      end
    end
  end

end
