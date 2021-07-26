module Company::NotificationsHelper

  # デザイン投稿者からきたオファーのみの通知を表示
  def notification_form(notification)
    if notification.action == "offer"
      tag.a("#{notification.design_contributor.pen_name}様のデザイン", href: company_post_path(notification.post_id)) + "の" + tag.a("オファー結果", href: company_company_path(current_company)) + "が届いています"
    end
  end

end
