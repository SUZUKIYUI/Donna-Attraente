class Company::OffersController < ApplicationController

  before_action :authenticate_company!

  def new
    @post = Post.find(params[:post_id])
    @offer = Offer.new
  end

  def create
    @post = Post.find(params[:post_id])
    @offer = Offer.new(offer_params)
    @offer.company_id = current_company.id
    @offer.post_id = @post.id
    if @offer.save
      @post.create_notification2_offer!(current_company, @offer.id, @post.design_contributor.id)
      redirect_to company_post_path(@post.id)
    else
      render :new
    end
  end

  # この下に何も記述しないこと！
  private

  def offer_params
    params.require(:offer).permit(:offer_comment, :offer_status)
  end

end
