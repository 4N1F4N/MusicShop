class OrderStatus < ApplicationRecord
  belongs_to :order
  after_save :update_status

  def can_up
    self.status_id > 0 && self.status_id < 5
  end

  def can_pay
    self.status_id == 1
  end

  def can_cancel
    self.status_id == 1
  end

  def can_receive
    self.status_id == 4
  end
  
  def update_status
    if self.status_id == 0
      self.title = "Отменен"
    elsif self.status_id == 1
      self.title = "Создан"
    elsif self.status_id == 2
      self.title = "Оплачен"
    elsif self.status_id == 3
      self.title = "Собран"
    elsif self.status_id == 4
      self.title = "Готов к выдаче"
    elsif self.status_id == 5
      self.title = "Получен"
    end   
  end
end
