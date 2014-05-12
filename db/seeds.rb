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
	User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.word)
end

puts "Created Users"
puts "-"*50

20.times do
	Group.create(group_name: Faker::Lorem.word)
end

puts "Created Groups"
puts "-"*50

200.times do
	Team.create(team_name: Faker::Lorem.word, user_id: User.all.sample.id, group_id: Group.all.sample.id)
end

puts "Created Teams"
puts "-"*50


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
									 venue: tournament["venue"][0]["name"],
									 city: tournament["venue"][0]["city"],
									 state: tournament["venue"][0]["state"],
									 country: tournament["venue"][0]["country"],
									 group_id: Group.all.sample.id )
	end

puts "seeded Tournaments"
puts "-"*50
# player_url = "http://api.sportsdatallc.org/golf-t1/profiles/pga/2014/players/profiles.xml?api_key=#{key}"
# player_response = open(player_url).read
# golfer_profiles = XmlSimple.xml_in(player_response)

player_stat_url = "http://api.sportsdatallc.org/golf-t1/seasontd/pga/2014/players/statistics.xml?api_key=#{key}"
player_stat_response = open(player_stat_url).read
golfer_stats = XmlSimple.xml_in(player_stat_response)


golfer_stats["season"][0]["player"].each do |player|
							  Golfer.create(first_name: player["first_name"],
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

puts "seeded Golfers"
puts "-"*50

Team.all.each do |team|
	6.times do 
		Golfers_Team.create(golfer_id: Golfer.all.sample.id, team_id: team.id)
	end
end

puts "Randomized teams"
puts "-"*50

points = [1, 2, 3, 4]

Tournament.all.each do |tournament|
	Golfers_Tournament.create(golfer_id: Golfer.all.sample.id, tournament_id: Tournament.all.sample.id, golfer_tournament_points: points.sample)
end


# tournament_url = "http://api.sportsdatallc.org/golf-t1/leaderboard/pga/2014/tournaments/8d463c8b-e259-482d-8729-3c9efa877a22/leaderboard.xml?api_key=#{key}"
# tournament_statuses = open(tournament_url).read


# tournament_data["leaderboard"][0]["player"].each do |player|
# 	puts player["first_name"]
# 	puts player["last_name"]
# 	puts player["position"]
# end


