class OrderedProduct < ApplicationRecord
  has_one :cart
  has_one :product
  has_one :order
end
