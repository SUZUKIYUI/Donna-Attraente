module DesignContributor::Notification2sHelper

  # 企業からきたオファーのみの通知を表示
  def notification_design_contributor_offer_form(notification2)
    @visitor = notification2.company

    tag.a(@visitor.company_name, href: design_contributor_company_path(@visitor)) + "様から" + tag.a("あなたのデザイン", href: design_contributor_post_path(notification2.post_id)) + "にオファーが届きました"
  end

  def unchecked_notification2s
    @notification2s = current_design_contributor.notification2s.where(checked: false)
  end

end
