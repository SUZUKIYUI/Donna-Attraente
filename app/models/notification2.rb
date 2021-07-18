class Notification2 < ApplicationRecord
  belongs_to :company
  belongs_to :design_contributor
  belongs_to :post
  belongs_to :offer
end
