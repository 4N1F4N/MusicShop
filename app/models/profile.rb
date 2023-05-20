class Profile < ApplicationRecord
  has_secure_password

  has_one :cart
  has_one :status
  has_many :order

  after_save :create_cart, :add_status
  after_destroy :destroy_cart

  private 
    def create_cart
      cart = Cart.new(profile_id: self.id)
      cart.save
    end

    def add_status

    end
    
    def destroy_cart
      cart = self.cart
      cart.destroy
    end
end
