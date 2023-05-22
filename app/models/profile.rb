class Profile < ApplicationRecord
  has_secure_password

  has_one :cart
  has_one :status
  has_many :order

  before_save :add_status
  after_save :create_cart
  after_destroy :destroy_cart

  def admin?
    ProfileStatus.find(self.profile_statuses_id).admin?
  end

  def techstaff?
    ProfileStatus.find(self.profile_statuses_id).techstaff?
  end

  private 
    def create_cart
      cart = Cart.new(profile_id: self.id)
      cart.save
    end

    def add_status
      self.profile_statuses_id = 1
    end
    
    def destroy_cart
      cart = self.cart
      cart.destroy
    end
end
