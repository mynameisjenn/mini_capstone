class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true

  has_secure_password
  has_many :carted_products
  has_many :orders  


  def current_cart
    carted_products.where(status: "carted")
  end
end
