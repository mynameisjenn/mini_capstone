json.id @order.id

json.user do
  json.user_id @order.user_id
  json.email @order.user.email
end

json.product do
  json.partial! @order.product, partial: 'api/products/product', as: :product
end

json.quantity @order.quantity

json.formatted do
  json.subtotal number_to_currency(@order.subtotal)
  json.tax number_to_currency(@order.tax)
  json.total number_to_currency(@order.total)
end

json.purchased_on @order.purchased_on