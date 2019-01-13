class Order < ActiveRecord::Base

  PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]

  # associations
  has_many :line_items, dependent: :destroy
  has_many :discounts

  # validations
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  # methods
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items<<item
    end
  end
end