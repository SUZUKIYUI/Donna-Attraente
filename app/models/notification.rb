class Notification < ApplicationRecord

  default_scope -> {order(created_at: :desc)}

  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :offer, optional: true
  belongs_to :design_contributor
  belongs_to :visited_user, polymorphic: true
end
