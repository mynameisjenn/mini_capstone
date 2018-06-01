require 'unirest'

response = Unirest.post(
                        "http://localhost:3000/api/carted_products", parameters: {
                                      product_id: 2,
                                      quantity: 2    
                                      }
                          )

puts JSON.pretty_generate(response.body)