class DesignContributor::CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    # ----------------------------------
    if Offer.exists?
      if Offer.where(company_id: @company.id, offer_status: 1).exists?
        @offers = Offer.where(post_id: @post.id, offer_status: 1)
      end
    end
  end

end
