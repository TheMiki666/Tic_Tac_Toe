class GameManager
  MAX_MOVES=9

  def initialize (board)
    @board=board
    @score_X=0
    @score_Y=0
    @first_turn="X"
    @turn="X"
    greet
    new_game
  end


  # Starts a new game
  def new_game
    puts
    puts "Let's start the game!"
    puts "Player #{@first_turn} makes first movement"
    puts
    @moves=0
    @turn=@first_turn
    @first_turn=switch_X_O(@first_turn)
    game_loop
  end

  def game_loop
    loop_exit=0   #0: no exit; 1: there is a winner 2: draw; #3: player wants to break
    loop do
      @board.draw
      puts 
      response=ask_for_move
      loop_exit=3 if response=="BREAK"
      break if loop_exit==3
      #now we try to set the chip at the square said by the player
      if @board.try_set_chip(response[0],response[1], @turn)
        #correct movement
        @moves += 1
        @turn=switch_X_O(@turn)
        if @board.check_victory
          loop_exit=1
        elsif @moves==MAX_MOVES
          loop_exit=2
        end
      else
        puts "INCORRECT MOVEMENT"
        puts "That square of the board is occupied already"
        puts
      end
      break if loop_exit>0
    end
    case loop_exit
    when 1
      puts "There is a winner!"    #HACER FUNCIÓN QUE GESTIONE VICTORIA 
    when 2
      puts "The board is full, and nobody wins." #HACER FUNCIÓN QUE GESTIONE EMPATE
    when 3
      puts "Thanks for playing!"
    end
  end

  # Ask the player for a move
  # It does not stop until the player writes "BREAK", or an answer in the correct format
  # If it is, this method returns an array, with de number of the row and
  # the number of the colum
  def ask_for_move
    response=""
    loop do
      ok = false
      puts "Player #{@turn}, enter your move, please:"
      response=gets.chomp
      break if response=="BREAK"
      puts
      if response.length!=3
        puts "INCORRECT INPUT"  #TODO: COLORIZE TO RED
        instructions
      else
        first=response[0]
        last=response[2]
        if (first!='1' && first!='2' && first!='3') || (last!='1' && last!='2' && last!='3') 
          puts "INCORRECT INPUT"  #TODO: COLORIZE TO RED
          instructions
        else
          ok=true
          response=Array.new()
          response[0]=first.to_i
          response[1]=last.to_i
        end
      end
      break if ok 
    end
    response
  end



private

  # Greets the players
  def greet
    puts "***************************"
    puts "* Welcome to Tic Tac Toe! *"
    puts "***************************"
    puts
    puts "This is a game for to players:"
    puts "Player X and Player Y"
    puts 
    instructions
    print "Press enter to continue"
    gets

  end

  # Shows the instructions at the console
  def instructions
    puts "Players must enter their moves in this format:"
    puts "R,C (or R-C, or R;C, or R/C, etc.)"
    puts "...where the R is the number of the row, "
    puts "and C is the number of the column."
    puts "For example: 3,1"
    puts "It means row 3, column 1"
    puts
    puts "Write BREAK if you want to finish the game"
    puts 

  end

  def switch_X_O (letter)
    if letter=="X"
      "O"
    elsif letter=="O"
      "X"
    else
      false
    end
  end
end