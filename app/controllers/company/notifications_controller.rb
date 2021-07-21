class Company::NotificationsController < ApplicationController
  
  # デザイン投稿者から企業にきたオファーの返信通知一覧
  def index
    @notifications = current_company.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
  
end
