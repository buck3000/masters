class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :golfers, through: :golfers_teams
end
