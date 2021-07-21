class DesignContributor::NotificationsController < ApplicationController

  def index
    @notifications = current_design_contributor.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

end
