module Company::NotificationsHelper

  # デザイン投稿者からきたオファーのみの通知を表示
  def notification_company_offer_form(notification)
    @visitor = notification.visitor
    case notification.action
      when "offer" then
        tag.a("#{@visitor.pen_name}様のデザイン", href: company_post_path(notification.post)) + "の" + tag.a("オファー結果", href: company_company_path(notification.visitedable_id)) + "が届いています"
    end
  end

  def unchecked_offer_notifications
    @offer_notifications = current_company.passive_notifications.where(checked: false)
  end

end
