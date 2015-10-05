# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
game_params = [
  {name: 'Super Mario', category: 'Platform'},
  {name: 'Metroid', category: 'Platform'},
  {name: 'Astroids', category: 'Classic'},
  {name: 'Pac Man', category: 'Classic'},
  {name: 'Space Invaders', category: 'Arcade'},
  {name: 'Legend of Zelda', category: 'RPG'},
  {name: 'Dragon Warrior', category: 'RPG'},
  {name: 'Mega Man', category: 'Platform'},
  {name: 'Duck Hunt', category: 'Shooter'},
  {name: 'Punch Out', category: 'Fighter'},

]
puts "Seeding DB "
games = []
game_params.each {|g| games << Game.find_or_create_by(g)}
puts "Created #{games.length} Games"
user_names = %w{Mike Jason Chris David James John Bobert Brian Matt Dan Jenn Amy Mel Heather Angie Michelle Kim Jessica Lisa Amanda}
#user_names = ['Brian']
users = []
user_names.each {|n| users << User.find_or_create_by({username: n})}
puts "Created #{users.length} Users"

base_date = Date.new(2000, 1,1)

users.each do |user|
  ActiveRecord::Base.transaction do
    puts "Creating Scores for #{user.username}"
    games.each do |game|
      base_score = rand(20000) + 50000
      base_var = rand(5)
      1000.times do |i|
        Score.create( {value: [0,(base_score + base_var * rand(20000)-10000)].max, date: base_date + i, user_id: user.id, game_id: game.id})
      end
      puts " Created 1000 Scores for #{game.name}"
    end
  end
  puts " !** Scores saved"
end
