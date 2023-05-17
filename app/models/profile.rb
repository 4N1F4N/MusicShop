class Profile < ApplicationRecord
  has_secure_password

  has_one :cart

  after_save :create_cart

  private 

    def create_cart
      cart = Cart.new(profile_id: self.id)
      cart.save
    end
end
