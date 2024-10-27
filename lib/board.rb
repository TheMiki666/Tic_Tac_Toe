
class Board 

  def initialize
    clear
  end

  #Gets the chip of the row and col of the board; returns false if the number of col and row are incorrect
  def get_chip(row, col)
    if row<1 || row>3 || col<1 || col>3
      false
    else
      @squares[row-1][col-1]
    end
  end

  # Gets the chip of the row and col of the board; 
  # returns false if the number of col and row, or the chip are incorrect; true otherwise
  def set_chip(row, col, chip)
    if row<1 || row>3 || col<1 || col>3 
      false
    elsif chip!=" " && chip!="X" && chip !="O"
      false
    else
      @squares[row-1][col-1]=chip
      true
    end
  end

  # Clears all the board
  def clear
    @squares=Array.new
    (0..2).each do |row|
      @squares[row]=Array.new
      (0..2).each do |col|
        @squares[row][col]=" "
      end
    end
  end

  ##Draws the boad on console
  def draw
    puts "   | 1 | 2 | 3 |"
    puts "----------------"
    (0..2).each do |i|
      row_draw=" #{i+1} "
      (0..2).each do |j|
        row_draw.concat("| #{@squares[i][j]} ")
      end
      puts row_draw.concat("|")
      puts "----------------"
    end
    puts
  end

  # Checks if a player has won
  # Returns false, if nobody has won; if there is a winner, returns a string of three letters
  # Firstletter: is X or O; second letter is R for rows, C for cols, or D for diagonals; 
  # Third letter is the number of row or column; if the winning line is a diagonal, 1 for the up-left to down-right diagonal,
  # 2 for the other
  def check_victory

  end
    
end