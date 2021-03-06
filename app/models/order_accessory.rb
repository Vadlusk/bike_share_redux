class OrderAccessory < ApplicationRecord
  validates :quantity, presence: true
  belongs_to :order
  belongs_to :accessory

  def subtotal
    accessory.price * quantity
  end
end
