class Concert < ApplicationRecord
    has_many :tickets
    has_many :users, through: :tickets

    scope :ordered_by_date, -> { order(date: :asc) }
end
