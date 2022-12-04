class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  belongs_to :customer

  enum billing_method: {credit_card: 0, transfer: 1}
  enum notes_status: {waiting: 0, confirmation: 1, making: 2, shipping: 3, completion: 4}
  
validates :postal_code, presence: true
validates :address, presence: true
validates :name, presence: true
validates :postage, presence: true
validates :billing, presence: true
  
end
