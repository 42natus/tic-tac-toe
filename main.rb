require_relative 'lib/grid'
require_relative 'lib/player'
require_relative 'lib/strikable'

grid = Grid.new
player_x = Player.new('X')
player_o = Player.new('O')

grid.display

until grid.gameover?
  player_x.play(grid)
  
  grid.display

  if grid.gameover?
    break
  end
  
  player_o.play(grid)

  grid.display
end

puts '--- GAME OVER ---'
if grid.draw?
  puts 'The game\'s a tie!'
else
  grid.announce_winner(player_x, player_o)
end
