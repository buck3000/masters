class Tournament < ActiveRecord::Base
	belongs_to :group
  has_many :golfers, through: :tournament_golfers
end

