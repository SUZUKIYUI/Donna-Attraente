class Notification < ApplicationRecord

  default_scope -> {order(created_at: :desc)}

  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :offer, optional: true
  belongs_to :visitor, class_name: "DesignContributor", foreign_key: "visitor_id", optional: true
  belongs_to :visitedable, polymorphic: true, foreign_key: "visitedable_id", optional: true
end
