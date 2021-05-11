class User < ApplicationRecord
    has_secure_password
    has_many :tickets, dependent: :destroy
    has_many :concerts, through: :tickets
    validates :name, :username, :email, presence: true
    validates :username, :email, uniqueness: true 
end