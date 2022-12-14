class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum create_status: { bad: 0, wait: 1, making: 2, completion: 3}
  
  def subtotal
    item.with_tax_price * amount
  end

end
