class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :concert
  validates :quantity, presence: true  
end
