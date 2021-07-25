module DesignContributor::Notification2sHelper

  # 企業からきたオファーのみの通知を表示
  def notification2_form(notification2)
    @visitor = notification2.company

    tag.a(@visitor.company_name, href: design_contributor_company_path(@visitor)) + "様から" + tag.a("あなたのデザイン", href: design_contributor_post_path(notification2.post_id)) + "にオファーが届きました"
  end

end
