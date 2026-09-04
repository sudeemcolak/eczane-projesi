class Drugstore < ApplicationRecord
    has_many :orders #birden fazla order oldugu icin orders girmesini bekliyo 
    has_many :drugstore_stocks #birden fazla drugstore_stock oldugu icin drugstore_stocks girmesini bekliyo
    has_many :pharmacists #birden fazla eczacı oldugu icin pharmacists girmesini bekliyo
end
