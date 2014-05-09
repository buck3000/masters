class CreateGolfersTeamsTable < ActiveRecord::Migration
  def change
  	create_table :golfers_teams do |t|
	  	t.belongs_to :golfer
	  	t.belongs_to :team
	  end
  end
end
