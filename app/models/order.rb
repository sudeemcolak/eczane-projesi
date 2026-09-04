class Order < ApplicationRecord
    belongs_to :user #order bir kullaniciya aittir
    belongs_to :drugstore #order bir drugstore'a aittir
    has_many :order_items #order birden fazla order_item icerebilir
end
