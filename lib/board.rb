
class Board 

  def initialize
    clear
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
  # If there is more than one winning linge, it returns the first one it founds
  def check_victory
    # Checking rows
    (0..2).each do |i|
      row = @squares[i]
      if row[0]=="X" && row[1]=="X" && row[2]=="X"
        return "XR#{i+1}"
      elsif row[0]=="O" && row[1]=="O" && row[2]=="O"
        return "OR#{i+1}"
      end
    end

    # Checking cols
    (0..2).each do |j|
      if @squares[0][j]=="X" && @squares[1][j]=="X" && @squares[2][j]=="X"
        return "XC#{j+1}"
      elsif @squares[0][j]=="O" && @squares[1][j]=="O" && @squares[2][j]=="O"
        return "OC#{j+1}"
      end
    end

    # Checking diagonals
    if @squares[0][0]=="X" && @squares[1][1]=="X" && @squares[2][2]=="X"
      return "XD1"
    elsif @squares[0][0]=="O" && @squares[1][1]=="O" && @squares[2][2]=="O"
      return "OD1"
    elsif @squares[0][2]=="X" && @squares[1][1]=="X" && @squares[2][0]=="X"
      return "XD2"
    elsif @squares[0][2]=="O" && @squares[1][1]=="O" && @squares[2][0]=="O"
      return "OD2"
    end
    return false
  end

  # tries to set a chip, but if the squared is ocupied by a chip, it can not, returning false
  # if the square is empty, changes the chip and returns true
  def try_set_chip(row, col, chip)
    ok = get_chip(row, col)
    if (!ok || ok!=" ") #no correct square or square occupied
      false
    else
      set_chip(row, col, chip)
    end
  end

  private

  # Gets the chip of the row and col of the board; returns false if the number of col and row are incorrect
  def get_chip(row, col)
    if row<1 || row>3 || col<1 || col>3
      false
    else
      @squares[row-1][col-1]
    end
  end

  # Sets the chip of the row and col of the board; 
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

    
end