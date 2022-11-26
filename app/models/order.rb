class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customer

  enum billing_method: {credit_card: 0, transfer: 1}
  # enum notes_status: {wating: 0, confirmation: 1, create: 2, send: 3, close: 4}
  
  
  
end
