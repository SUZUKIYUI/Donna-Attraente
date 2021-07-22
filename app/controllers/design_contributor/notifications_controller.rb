class DesignContributor::NotificationsController < ApplicationController

  # デザイン投稿者からデザイン投稿者にきたいいね・コメントの通知一覧
  def index
    @notifications = current_design_contributor.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  # 企業からデザイン投稿者にきたオファーの通知一覧
  def index_offer
    @notification2s = current_design_contributor.notification2s
    @notification2s.where(checked: false).each do |notification2|
      notification2.update_attributes(checked: true)
    end
  end

  # デザイン投稿者からデザイン投稿者にきたいいね・コメントの通知全部削除
  def destroy
    @notifications = current_design_contributor.passive_notifications.destroy_all
    redirect_to design_contributor_notifications_path
  end

end
