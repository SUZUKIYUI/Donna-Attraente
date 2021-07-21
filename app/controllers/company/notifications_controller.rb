class Company::NotificationsController < ApplicationController

  # デザイン投稿者から企業にきたオファーの返信通知一覧
  def index
    @notifications = current_company.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  # デザイン投稿者から企業にきたオファーの返信通知全部削除
  def destroy
    @notifications = current_company.passive_notifications.destroy_all
    redirect_to company_notifications_path
  end

end
