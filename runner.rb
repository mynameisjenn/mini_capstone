require 'unirest'
# index action

# response = Unirest.get("http://localhost:3000/api/products")
# puts JSON.pretty_generate(response.body)

# response = Unirest.get("http://localhost:3000/api/products/1")
# puts JSON.pretty_generate(response.body)

# response = Unirest.post("http://localhost:3000/api/products",
#                         parameters: {
#                                       name: "Battleship",
#                                       price: 15,
#                                       description: "Strategy Peg Game",
#                                       image_url: "https://cf.geekdo-images.com/opengraph/img/pKuq6nVdtkIwhX8-gW0SSMNACmk=/fit-in/1200x630/pic288374.jpg"
#                           })
# puts JSON.pretty_generate(response.body)

# product_id = 1
# runner_params = {
#                 name: "Clue"
#                 }

# response = Unirest.patch(
#                         "http://localhost:3000/api/products/#{product_id}",
#                         parameters: runner_params)
# data = response.body
# puts JSON.pretty_generate(data)

product_id = 2
response = Unirest.delete("http://localhost:3000/api/products/#{product_id}")
data = response.body
puts JSON.pretty_generate(data)


