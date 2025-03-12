# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data (optional)
Product.destroy_all

# Sample Products with Online Image URLs
products = [
  { name: "Laptop", price: 800.00, image: "https://helios-i.mashable.com/imagery/articles/05djrP5PjtVB7CcMtvrTOAP/images-1.fill.size_2000x1125.v1723100793.jpg", category: "Electronics" },
  { name: "Smartphone", price: 500.00, image: "https://img.freepik.com/premium-photo/smartphone-balancing-with-pink-background_23-2150271746.jpg?semt=ais_hybrid", category: "Electronics" },
  { name: "Headphones", price: 150.00, image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhZHBob25lfGVufDB8fDB8fHww", category: "Accessories" },
  { name: "Backpack", price: 50.00, image: "https://mokobara.com/cdn/shop/files/The-Cheddar-Backpack_JB-1.jpg?v=1739271728&width=2048", category: "Bags" },
  { name: "Running Shoes", price: 120.00, image: "https://media.istockphoto.com/id/1350560575/photo/pair-of-blue-running-sneakers-on-white-background-isolated.jpg?s=612x612&w=0&k=20&c=A3w_a9q3Gz-tWkQL6K00xu7UHdN5LLZefzPDp-wNkSU=", category: "Footwear" },
  { name: "Tablet", price: 300.00, image: "https://media.wired.com/photos/649b2dbfc859c4a1cdecc412/master/w_960,c_limit/Amazon-Fire-Max-11-Review--Stand-Gear.jpg", category: "Electronics" },
  { name: "Smartwatch", price: 200.00, image: "https://hammeronline.in/cdn/shop/files/Hammerglidebluetoothcallingsmartwatch_1.webp?v=1694851875", category: "Electronics" },
  { name: "Gaming Mouse", price: 75.00, image: "https://5.imimg.com/data5/SELLER/Default/2023/7/324134760/FU/MW/TG/79174257/gaming-mouse-500x500.png", category: "Accessories" },
  { name: "Wireless Keyboard", price: 90.00, image: "https://deq64r0ss2hgl.cloudfront.net/images/products_gallery_images/portronics-wireless-keyboard-76607827469428.jpg", category: "Accessories" },
  { name: "Leather Wallet", price: 45.00, image: "https://godbolegear.com/cdn/shop/files/SingleCashPocket-ClassicWallet-StuffedwithCardsandCash.jpg?v=1722840632", category: "Accessories" },
  { name: "Duffle Bag", price: 85.00, image: "https://m.media-amazon.com/images/I/71VH9kFMm8L._AC_UY1100_.jpg", category: "Bags" },
  { name: "Casual Sneakers", price: 110.00, image: "https://www.jiomart.com/images/product/original/rvvfxmryd6/lnt-fashion-casual-sneakers-white-outdoor-shoes-for-boys-and-men-sneakers-for-men-product-images-rvvfxmryd6-0-202310212048.jpg?im=Resize=(1000,1000)", category: "Footwear" },
  { name: "Formal Shoes", price: 130.00, image: "https://www.zoomshoes.in/cdn/shop/files/PG64BL_1.jpg?v=1688448197", category: "Footwear" },
  { name: "Bluetooth Speaker", price: 180.00, image: "https://m.media-amazon.com/images/I/713TUYjagQL.jpg", category: "Electronics" },
  { name: "Sunglasses", price: 70.00, image: "https://greyjack.in/cdn/shop/files/GREYJACK3241-C7-01.jpg?v=1702013776", category: "Accessories" }
]





products.each do |product|
  Product.create!(product)
end

puts "Seeded #{Product.count} products successfully!"

descriptions = {
  "Laptop" => "A powerful and stylish laptop.",
  "Smartphone" => "A sleek smartphone with an impressive display.",
  "Headphones" => "High-quality noise-canceling headphones.",
  "Backpack" => "A lightweight and durable backpack.",
  "Running Shoes" => "A comfortable and stylish pair of running shoes.",
  "Tablet" => "A versatile tablet for work and entertainment.",
  "Smartwatch" => "A premium smartwatch with advanced features.",
  "Gaming Mouse" => "A high-performance gaming mouse.",
  "Wireless Keyboard" => "A wireless keyboard with ergonomic design.",
  "Leather Wallet" => "A stylish and durable leather wallet.",
  "Duffle Bag" => "A spacious and travel-friendly duffle bag.",
  "Casual Sneakers" => "Trendy casual sneakers for everyday wear.",
  "Formal Shoes" => "Elegant formal shoes for professional looks.",
  "Bluetooth Speaker" => "A Bluetooth speaker with deep bass sound.",
  "Sunglasses" => "Stylish sunglasses with UV protection."
}

Product.all.order(:id).each do |product|
  if descriptions[product.name]
    product.update(description: descriptions[product.name])
  end
end
