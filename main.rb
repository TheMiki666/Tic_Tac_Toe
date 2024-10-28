require_relative 'lib/board'
require_relative 'lib/game_manager'

my_board = Board.new
gm = GameManager.new(my_board)
gm.start
