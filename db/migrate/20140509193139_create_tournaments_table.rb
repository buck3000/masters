class CreateTournamentsTable < ActiveRecord::Migration
  def change
  	create_table :tournaments do |t|
  		t.string :tournament_name
  		t.date :start_date
  		t.date :end_date
  		t.string :venue
  		t.string :city
  		t.string :state
  		t.string :country
  		t.string :tournament_api_id
      t.belongs_to :group

  		t.timestamps
  	end
  end
end
