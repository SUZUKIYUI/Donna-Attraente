class Notification < ApplicationRecord
    default_scope -> {order(created_at: :desc)}
    belongs_to :post, optional: true
    belongs_to :comment, optional: true
    belongs_to :offer, optional: true
    belongs_to :visitor_design_contributor, class_name: "DesignContributor", foreign_key: "visitor_design_contributor_id", optional: true
    belongs_to :visited_design_contributor, class_name: "DesignContributor", foreign_key: "visited_design_contributor_id", optional: true
    belongs_to :visitor_company, class_name: "Company", foreign_key: "visitor_company_id", optional: true
    belongs_to :visited_company, class_name: "Company", foreign_key: "visited_company_id", optional: true
end
