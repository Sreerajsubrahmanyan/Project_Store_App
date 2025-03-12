class UpdateProductDescriptions < ActiveRecord::Migration[8.0]
  def up
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
  end

  def down
    Product.update_all(description: nil)
  end
end
