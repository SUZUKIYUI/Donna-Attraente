module Company::NotificationsHelper

  # デザイン投稿者からきたオファーのみの通知を表示
  def notification_form(notification)
    if notification.action == "offer"
      tag.a("こちらのデザイン", href: company_post_path(notification.post_id)) + "の" + tag.a("オファー結果が届いています", href: company_company_path(current_company))
    end
  end

end
