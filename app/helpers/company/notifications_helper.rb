module Company::NotificationsHelper

  # デザイン投稿者からきたオファーのみの通知を表示
  def notification_form(notification)
    case notification.action
      when "offer" then
        tag.a("#{notification.design_contributor.pen_name}様のデザイン", href: company_post_path(notification.post_id)) + "のオファー結果が届いています"
    end
  end

  def unchecked_offer_notifications
    @offer_notifications = current_company.passive_notifications.where(checked: false)
  end

end
