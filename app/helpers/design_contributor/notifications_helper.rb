module DesignContributor::NotificationsHelper
    def notification_form(notification)
        # 通知を送った人
        @design_contributor = notification.design_contributor
        @comment = nil
        @design_contributor_comment = notification.comment_id

        case notification.action
            when "want" then
                tag.a(@design_contributor.pen_name, href: design_contributor_design_contributor_path(@design_contributor)) + "が" + tag.a("あなたのデザイン", href: design_contributor_post_path(notification.post_id)) + "になにこれ欲しいを押しました"
            when "comment" then
                @comment = Comment.find_by(id: @design_contributor_comment)&.comment
                teg.a(@design_contributor.pen_name, href: design_contributor_design_contributor_path(@design_contributor)) + "が" + tag.a("あなたのデザイン", href: design_contributor_post_path(notification.post_id)) + "にコメントしました"
        end
    end
    
    def unchecked_notifications
        @notifications = current_design_contributor.passive_notifications.where(checked: false)
    end
end
