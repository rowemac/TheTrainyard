class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :concert
  validates_presence_of :quantity
end
