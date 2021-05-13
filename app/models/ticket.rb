class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :concert
  # validates :quantity, presence: true
  validates :quantity, :numericality => { :greater_than => 0 } 
end
