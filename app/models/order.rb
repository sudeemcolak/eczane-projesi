class Order < ApplicationRecord
    belongs_to :user #order bir kullaniciya aittir
    has_many :order_items #order birden fazla order_item icerebilir
end
