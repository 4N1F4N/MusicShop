class ProfileStatus < ApplicationRecord
  has_many :profiles

  def admin?
    self.access_level == 3
  end

  def techstaff?
    self.access_level == 2
  end
end
