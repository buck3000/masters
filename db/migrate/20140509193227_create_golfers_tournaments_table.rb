class CreateGolfersTournamentsTable < ActiveRecord::Migration
  def change
  	create_table :golfers_tournaments do |t|
	  	t.belongs_to :golfer
	  	t.belongs_to :tournament
	  	t.integer :golfer_tournament_points
	  end
  end
end
