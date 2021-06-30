class Want < ApplicationRecord
  belongs_to :design_contributor
  belongs_to :post
end
