class Concert < ApplicationRecord
    has_many :tickets
    has_many :users, through: :tickets

    # scope :purchasable, -> { where(sold_out: false ) }
    scope :ordered_by_date, -> { order(date: :asc) }
end
