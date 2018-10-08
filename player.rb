class Player

  attr_reader :name, :lives, :max_lives

  def initialize(name)
    @name = name
    @max_lives = 3
    @lives = @max_lives
  end

  def lose_a_life
    @lives -= 1
  end

end