# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
game_params = [
  {name: 'Super Mario', category: 'Platform'},
  {name: 'Metroid', category: 'Platform'},
  {name: 'Astroids', category: 'Classic'},
  {name: 'Pac Man', category: 'Classic'},
  {name: 'Pong', category: 'Classice'},
  {name: 'Galaga', category: 'Arcade'},
  {name: 'Space Invaders', category: 'Arcade'},
  {name: 'Legend of Zelda', category: 'RPG'},
  {name: 'Castlevania', category: 'Platform'},
  {name: 'Dragon Warrior', category: 'RPG'},
  {name: 'Mega Man', category: 'Platform'},
  {name: 'Duck Hunt', category: 'Shooter'},
  {name: 'Punch Out', category: 'Fighter'},

]
puts "Seeding DB "
games = []
game_params.each {|g| games << Game.find_or_create_by(g)}
puts "Created #{games.length} Games"
#user_names = %w{Mike Jason Chris David James John Bobert Brian Matt Dan Jenn Amy Mel Heather Angie Michelle Kim Jessica Lisa Amanda}
user_names = %w{James}
users = []
user_names.each {|n| users << User.find_or_create_by({username: n})}
puts "Created #{users.length} Users"

base_date = Date.new(2000, 1,1)

users.each do |user|
  scores = []
  ActiveRecord::Base.transaction do
    puts "Creating Scores for #{user.username}"
    games.each do |game|
      5000.times do |i|
        scores << {value: rand(100000), date: base_date + i, user_id: user.id, game_id: game.id}
        #Score.create(game: game, user: user, value: rand(100000), date: base_date + i )
        #print '.' if (i%1000 == 0)
      end
      puts " Created 5000 Scores for #{game.name}"
    end
    Score.create(scores)
  end
  puts " !** Scores saved"
end
