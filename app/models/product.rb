class Product < ApplicationRecord
  has_many :likes, dependent: :destroy
end
