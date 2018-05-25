Product.create!([
  {name: "Battleship", price: "15.0", image_url: "https://cf.geekdo-images.com/opengraph/img/pKuq6nVdtkIwhX8-gW0SSMNACmk=/fit-in/1200x630/pic288374.jpg", description: "Strategy Peg Game", active: true, supplier_id: nil},
  {name: "Old Maid", price: "5.0", image_url: "https://images-na.ssl-images-amazon.com/images/I/51we1pw9fqL._SY355_.jpg", description: "Card Game", active: true, supplier_id: nil},
  {name: "Dice", price: "10.0", image_url: "https://media.istockphoto.com/photos/red-dice-on-white-picture-id185118373?k=6&m=185118373&s=612x612&w=0&h=j50rvO5IvCUbqpyQ7qvbDQGK3mPylAYFRVbGo1t1Hx8=", description: "Gambling game", active: true, supplier_id: nil},
  {name: "Clue", price: "20.0", image_url: "https://i.pinimg.com/originals/8f/32/23/8f32231922200662689c27c1f0f04ca8.jpg", description: "Word Game with Tiles", active: true, supplier_id: 3},
  {name: "Uno", price: "8.0", image_url: "https://target.scene7.com/is/image/Target/17072908_Alt01?wid=488&hei=488&fmt=pjpeg", description: "Card Game", active: true, supplier_id: 2},
  {name: "Connect Four", price: "14.0", image_url: "http://i0.kym-cdn.com/photos/images/newsfeed/001/335/031/701.jpg", description: "Two Player Game", active: true, supplier_id: 1},
  {name: "Monopoly", price: "18.0", image_url: "https://target.scene7.com/is/image/Target/52117861_Alt01?wid=488&hei=488&fmt=pjpeg", description: "Strategy Game with Money", active: true, supplier_id: 3}
])
Supplier.create!([
  {name: "Milton Bradley", email: "mb@milton.com", phone_number: 444},
  {name: "Mattel", email: "mattel@toys.com", phone_number: 555},
  {name: "JaCo", email: "jaco@games.com", phone_number: 948}
])
