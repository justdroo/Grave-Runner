def space
  puts ""
  puts ""
  puts ""
  puts ""
end

class Tombstone

  attr_accessor :name

  def initialize(name)
    @name = name
    @rounds = 0
    @deaths = 0
  end

  def death
    @deaths += 1
  end

  def round
    @rounds += 1
  end

  def look_at_your_tombstone
    {rounds: @rounds, deaths: @deaths}
  end
end

class Fate

  attr_accessor :player, :fate

  def chance
    @player = rand(11)
    @fate = rand(11)
      if @player > @fate
        alive = true
      elsif @player <= @fate
        alive = false

      end
    {player: player, fate: fate, alive: alive}
    end

  def life_or_death(chance_hash)
    if chance_hash.fetch(:alive) == true
      "alive"
    elsif chance_hash.fetch(:alive) == false
      "dead"
    else
      "dead"
    end
  end
end
