require "./game.rb"
require "./player.rb"
require "./question.rb"

# Set up game
questions = Question.new
puts "Player 1, what's your name?"
player1 = Player.new(gets.chomp)
puts "Player 2, what's your name?"
player2 = Player.new(gets.chomp)

game = Game.new(player1, player2, questions)
game.play_game