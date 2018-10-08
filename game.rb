class Game
  def initialize(player1, player2, questions)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @questions = questions
    @winner = false
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def players_still_have_lives?
    @player1.lives <= 0 || @player2.lives <= 0
  end

  def handle_question
    current_question = @questions.create_question
    puts "#{@current_player.name}: #{current_question[:question]} (#{current_question[:answer]})"
    answer = yield
    if answer != current_question[:answer]
      puts "Sorry, that's incorrect!"
      @current_player.lose_a_life
    else
      puts "Correct! Nicely done."
    end
    handle_end_of_round
  end

  def handle_end_of_round
    if (!players_still_have_lives?)
      switch_player
      puts "Player 1 lives: #{@player1.lives}/#{@player1.max_lives} vs Player 2 lives: #{@player2.lives}/#{@player2.max_lives}"
      puts "------ NEW TURN ------"
    else
      @winner = true
    end
  end

  def game_over
    winner = @player1.lives != 0 ? @player1 : @player2
    puts "#{winner.name} wins the game with a score of #{winner.lives}/#{winner.max_lives}!"
    puts "------ GAME OVER ------"
    puts "Good bye!"
  end

  # Game Loop
  def play_game
    while !@winner do
      handle_question { gets.chomp.to_i }
    end
    game_over
  end

end