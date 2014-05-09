class CreateTeamsTable < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :team_name
    	t.belongs_to :user
    	t.belongs_to :group
    	t.integer :points
    	
    	t.timestamps
    end
  end
end
