class DesignContributor::NotificationsController < ApplicationController

  # デザイン投稿者からデザイン投稿者にきたいいね・コメントの通知一覧
  def index
    notifications = current_design_contributor.passive_notifications
    # @notifications = 自分宛の全ての通知（自分から自分への通知は含まない）
    @notifications = notifications.where.not(visitor_id: current_design_contributor.id)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

end
