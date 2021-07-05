class DesignContributor::OffersController < ApplicationController

  def edit
    @post = Post.find(params[:post_id])
    @offer = Offer.find(params[:id])
  end

  def update
  end

end
