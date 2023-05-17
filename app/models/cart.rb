class Cart < ApplicationRecord
  belongs_to :profile
  has_many :ordered_product
end
