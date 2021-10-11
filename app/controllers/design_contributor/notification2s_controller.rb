class DesignContributor::Notification2sController < ApplicationController

  before_action :authenticate_design_contributor!

  # 企業からデザイン投稿者にきたオファーの通知一覧
  def index
    @notification2s = current_design_contributor.notification2s
    @notification2s.where(checked: false).each do |notification2|
      notification2.update_attributes(checked: true)
    end
  end

end
