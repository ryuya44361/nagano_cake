class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum create_status: { bad: 0, wait: 1, making: 2, completi: 3}

end
