class User < ApplicationRecord
    has_secure_password 
    has_many :tickets
    has_many :concerts, through: :tickets
end
