class User < ApplicationRecord
    has_secure_password
    has_many :orders #user birden fazla order verebilir

    validates :name, presence: true
    validates :surname, presence: true
    validates :phone_no, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :address, presence: true
    validates :tc_no, presence: true, uniqueness: true
    
end
