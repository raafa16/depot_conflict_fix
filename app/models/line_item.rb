class LineItem < ActiveRecord::Base
  # associations
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  # methods
  def total_price
    product.price*quantity
  end
end
