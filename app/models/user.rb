class User < ApplicationRecord
    has_secure_password
    has_many :tickets, dependent: :destroy
    has_many :concerts, through: :tickets, dependent: :destroy
    validates :name, :username, :email, presence: true
    validates :email, uniqueness: true 
end