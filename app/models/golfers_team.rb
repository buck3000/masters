class Golfers_Team < ActiveRecord::Base
	
	belongs_to :golfer
	belongs_to :team
end
