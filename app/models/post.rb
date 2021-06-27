class Post < ApplicationRecord

  belongs_to :design_contributor

  attachment :post_image

end
