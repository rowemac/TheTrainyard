class Concert < ApplicationRecord
    has_many :tickets
    has_many :users, through: :tickets

    scope :ordered_by_date, -> { order(date: :asc) }
    scope :early_concerts, -> { where(time: "19:00:00").order(date: :asc) }
    # scope :search_headliner, -> (headliner) { where("headliner like ?", headliner) }
end
