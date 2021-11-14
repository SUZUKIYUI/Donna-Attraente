class DesignContributor::Notification2sController < ApplicationController

  before_action :authenticate_design_contributor!

  # 企業からデザイン投稿者にきたオファーの通知一覧
  def index
    # 現在ログイン中のユーザーの全ての「交渉中」のオファー通知
    @notification2s = Notification2.where(id: (Notification2.joins(:offer).where('offers.offer_status = 0').pluck(:id)), design_contributor_id: current_design_contributor.id)
    @notification2s.where(checked: false).each do |notification2|
      notification2.update_attributes(checked: true)
    end
  end

end
