class DesignContributor::NotificationsController < ApplicationController

  # デザイン投稿者からデザイン投稿者にきたいいね・コメントの通知一覧
  def index
    @notifications = current_design_contributor.passive_notifications
    # 以下@notifications更新
    @notifications = @notifications.where.not(design_contributor_id: current_design_contributor.id)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  # デザイン投稿者からデザイン投稿者にきたいいね・コメントの通知全部削除
  def destroy
    @notifications = current_design_contributor.passive_notifications.destroy_all
    redirect_to design_contributor_notifications_path
  end

end
