class Player

  attr_accessor :lives
  attr_reader :name, :max_lives

  def initialize(name)
    @name = name
    @max_lives = 3
    @lives = @max_lives
  end

end