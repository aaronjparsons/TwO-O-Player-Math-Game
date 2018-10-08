class Game
  def initialize(player1, player2, questions)
    @player1 = player1
    @player2 = player2
    @questions = questions
    @winner = false
  end

  def players_still_have_lives
    if @player1.lives > 0 || @player2.lives > 0
      true
    else
      false
    end
  end

  # Game Loop
  def play_game
    while !@winner do
      if players_still_have_lives
        current_question = @questions.create_question
        puts "#{current_question[:question]} (#{current_question[:answer]})"
        answer = gets.chomp.to_i
        if answer == current_question[:answer]
          @winner = true
        end
      end
    end
  end

end