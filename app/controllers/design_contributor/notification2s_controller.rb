class DesignContributor::Notification2sController < ApplicationController

  # 企業からデザイン投稿者にきたオファーの通知一覧
  def index
    @notification2s = current_design_contributor.notification2s
    @notification2s.where(checked: false).each do |notification2|
      notification2.update_attributes(checked: true)
    end
  end

  def destroy
    # 企業からデザイン投稿者にきたオファーの通知全部削除
    @notification2s = current_design_contributor.notification2s.destroy_all
    redirect_to design_contributor_notification_path
  end

end
