class Company::OffersController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @offer = Offer.new
  end

  def create
  end

end
