class DesignContributor::NotificationsController < ApplicationController

  # デザイン投稿者からデザイン投稿者にきたいいね・コメントの通知一覧
  def index
    @notifications = current_design_contributor.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy_all
    @notifications = current_design_contributor.passive_notifications.destroy_all
    redirect_to design_contributor_notifications_path
  end

end
