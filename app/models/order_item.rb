class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :oeder
  
  enum create_status: { bad: 0, wait: 1, create: 2, complete: 3}
  
end
