# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
require 'awesome_print'
require 'xmlsimple'
require 'faker'

200.times do
	puts "Creating users..."
	User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.word)
	puts "Users created..."
	puts "-"*50
end

200.times do
	Group.create(name: Faker::Lorem.word)

end

20.times do
	Team.create(name: Faker::Lorem.word, user_id: User.all.sample.id, group_id: Group.all.sample.id)
end


key = ENV["SD_GOLF_API_KEY"]
schedule_url = "http://api.sportsdatallc.org/golf-t1/schedule/pga/2014/tournaments/schedule.xml?api_key=#{key}"
schedule_response = open(schedule_url).read


tournament_schedule = XmlSimple.xml_in(schedule_response) 

tournament_schedule["season"][0]["tournament"].each do |tournament|
		Tournament.create(tournament_name: tournament["name"],
									 start_date: tournament["start_date"],
									 end_date: tournament["end_date"],
									 end_date: tournament["end_date"],
									 tournament_api_id: tournament["id"],
									 venue: tournament["venue"]["name"],
									 city: tournament["venue"]["city"],
									 state: tournament["venue"]["state"],
									 country: tournament["venue"]["country"],
									 group_id: Group.all.sample.id )
	end

# player_url = "http://api.sportsdatallc.org/golf-t1/profiles/pga/2014/players/profiles.xml?api_key=#{key}"
# player_response = open(player_url).read
# golfer_profiles = XmlSimple.xml_in(player_response)

player_stat_url = "http://api.sportsdatallc.org/golf-t1/seasontd/pga/2014/players/statistics.xml?api_key=#{key}"
player_stat_response = open(player_stat_url).read
golfer_stats = XmlSimple.xml_in(player_stat_response)


golfer_stats["season"][0]["player"].each do |player|
	golfer = Golfer.create(first_name: player["first_name"],
								last_name: player["last_name"],
								country: player["country"],
								cuts_made: player["statistics"][0]["cuts_made"],
								world_rank: player["statistics"][0]["world_rank"],
								first_place: player["statistics"][0]["first_place"],
								second_place: player["statistics"][0]["second_place"],
								third_place: player["statistics"][0]["third_place"],
								top_10: player["statistics"][0]["top_10"],
								top_25: player["statistics"][0]["top_25"],
								golfer_api_id: player["id"])
end



# tournament_url = "http://api.sportsdatallc.org/golf-t1/leaderboard/pga/2014/tournaments/8d463c8b-e259-482d-8729-3c9efa877a22/leaderboard.xml?api_key=#{key}"
# tournament_statuses = open(tournament_url).read


# tournament_data["leaderboard"][0]["player"].each do |player|
# 	puts player["first_name"]
# 	puts player["last_name"]
# 	puts player["position"]
# end


