def welcome
  space
  puts "Welcome"
  space

  #ask for name
  puts "What would you like to be known as?"
end

def ready?(player)
  puts "Are you ready to take a chance #{player.name}? [y/n]"
  ready = gets.chomp
  space
  ready
end

def show_tombstone(player)
  puts "R.I.P"
  puts player.name
  puts "Lives: #{player.look_at_your_tombstone.fetch(:rounds)}"
  puts "Deaths: #{player.look_at_your_tombstone.fetch(:deaths)}"
  space
end

def new_fate(player)
  player.round
  Fate.new
end

def did_they_die?(player, fate)
  if fate.life_or_death(fate.chance) == "alive"
    puts "Interesting..."
    space
    puts "Fate has been kind on you today #{player.name}."
    space
  elsif fate.life_or_death(fate.chance) == "dead"
    player.death
    puts "As expected..."
    space
    puts "You have died."
    space
  end
end

def are_you(ready, player)
  case ready
  when "y"
    did_they_die?(player, new_fate(player))
  when "n"
    puts "Very well"
    space
    return "exit"
  else
    puts "Do not play games with Fate. Enter [y/n]"
  end
end

#########
#########

def reaper_runner
  welcome

  input_name = gets.chomp
  space
  player = Tombstone.new(input_name) # creates a new tombstone object for player with the name they provided
  user_answer = ready?(player) #return user answer of [y/n]
  game = are_you(user_answer, player) #runs

  until game == "exit"
    user_answer = ready?(player) #return user answer of [y/n]
    game = are_you(user_answer, player)
  end

  show_tombstone(player)
end
