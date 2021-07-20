class DesignContributor::OffersController < ApplicationController

  def edit
    @post = Post.find(params[:post_id])
    @offer = Offer.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      @post.create_notification_offer!(current_design_contributor, @offer.id, @offer.company.id)
      redirect_to design_contributor_post_path(@post.id)
    else
      render :edit
    end
  end

  # この下に何も記述しないこと！
  private

  def offer_params
    params.require(:offer).permit(:offer_status)
  end

end
