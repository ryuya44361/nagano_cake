class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :oeder
end
