sclass Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal
    temp_subtotal = 0
    carted_products.each do |carted_product|
      temp_subtotal += carted_product.product.price * carted_product.quantity
    end
    self.subtotal = temp_subtotal
  end

  def calculate_tax
    self.tax = @order.subtotal * 0.09
  end

  def calculate_total
    self.total = subtotal + tax
  end

  def calculate_cart
    user.current_cart.update_all(status: "purchased", order_id: id)
    calculate_subtotal
    calculate_tax
    calculate_total
    save
  end

  def purchased_on
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end
  
end
