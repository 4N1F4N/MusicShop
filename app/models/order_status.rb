class OrderStatus < ApplicationRecord
  belongs_to :order
  after_save :update_status
  
  def update_status
    if self.status_id == 1
      self.title = "Создан"
    elsif self.status_id == 2
      self.title = "Оплачен"
    elsif self.status_id == 3
      self.title = "Собран"
    elsif self.status_id == 4
      self.title = "Отправлен"
    elsif self.status_id == 5
      self.title = "Получен"
    end   
  end
end
