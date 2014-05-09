class CreateGolfersTable < ActiveRecord::Migration
  def change
  	create_table :golfers do |t|
	  	t.string :golfer_api_id
	  	t.string :first_name
	  	t.string :last_name
	  	t.string :college
	  	t.string :height
	  	t.integer :weight

	  	t.integer :cuts_made
	  	t.integer :world_rank
	  	t.integer :first_place
	  	t.integer :second_place
	  	t.integer :third_place
	  	t.integer :top_10
	  	t.integer :top_25

	  	t.string :turned_pro
	  	t.timestamps
  	end
  end
end
