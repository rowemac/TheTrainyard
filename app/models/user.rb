class User < ApplicationRecord
    has_secure_password
    has_many :tickets, dependent: :destroy
    has_many :concerts, through: :tickets
    validates_presence_of :name, :username, :email
end