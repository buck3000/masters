class Golfers_Tournament < ActiveRecord::Base
	
	belongs_to :golfer
	belongs_to :tournament
end
