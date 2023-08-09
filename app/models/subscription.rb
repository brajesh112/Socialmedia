class Subscription < ApplicationRecord
	enum :duration, [:week, :month, :half_year, :year]
	enum :status, {active: 0, inactive: 1}
	belongs_to :magazine
	belongs_to :subscriber
end
