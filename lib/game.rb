# frozen_string_literal: true

require_relative 'game/grid'
require_relative 'game/player'
require_relative 'game/drawable'
require_relative 'game/strikable'

# This class controls gameplay over one or more rounds.
class Game
  def initialize
    @player_x = Player.new('X')
    @player_o = Player.new('O')

    puts '--- TIC TAC TOE ---'

    puts "\nWho's gonna be X? (X goes first)"
    @player_x.name = gets.chomp

    puts "\nWho's gonna be O?"
    @player_o.name = gets.chomp

    puts "\nHow many rounds d'you wanna play?"
    @rounds = gets.to_i
  end

  def play_round
    @grid.display

    until @grid.gameover?
      @player_x.play(@grid)

      @grid.display

      break if @grid.gameover?

      @player_o.play(@grid)

      @grid.display
    end
  end

  def round_results
    print 'RESULT: '
    if @grid.draw?
      puts 'The game\'s a tie!'
    else
      @grid.announce_winner(@player_x, @player_o)
    end
  end

  def game_results
    puts "#{@player_x.name} has #{@player_x.points} points"

    puts "#{@player_o.name} has #{@player_o.points} points"

    winner = @player_x.points > @player_o.points ? @player_x : @player_o

    puts "\n#{winner.name} wins!!!"
  end

  def play
    @rounds.times do |round|
      puts "\n#################"
      puts "ROUND #{round + 1}"

      @grid = Grid.new

      play_round

      round_results
    end

    puts "\n--- GAME OVER ---\n\n"

    game_results
  end
end
