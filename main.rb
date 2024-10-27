require_relative 'lib/board'

tablero=Board.new

tablero.set_chip(3,2,String.new("O"))
tablero.set_chip(1,1,String.new("X"))
tablero.set_chip(2,2,String.new("X"))
puts tablero.get_chip(1,1)
puts tablero.get_chip(3,2)
p tablero.get_chip(3,3)

tablero.draw

tablero.clear

tablero.draw

