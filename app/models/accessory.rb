class Accessory < ApplicationRecord
  validates_presence_of :title, :description
  enum status: ['active', 'retired']

  def active?
    return true if status == 'active'
    return false if status == 'retired'
  end

  def subtotal(count_in_cart)
    price * count_in_cart
  end
end