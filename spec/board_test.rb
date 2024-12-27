require_relative '../lib/board'
describe Board do
  subject(:test_board) { described_class.new }

  before do
    test_board.try_set_chip(1, 1, 'X')
    test_board.try_set_chip(3, 3, 'O')
  end

  describe '#try_set_chip' do
    it "putting an 'X' in an empty square" do
      my_squares = test_board.instance_variable_get(:@squares)
      expect(my_squares[0][0]).to eql('X')
    end
    it "putting an '0' in an empty square" do
      my_squares = test_board.instance_variable_get(:@squares)
      expect(my_squares[2][2]).to eql('O')
    end
    it 'returns false when trying to set a chip in an occupied square' do
      expect(test_board.try_set_chip(1, 1, 'O')).to be(false)
    end
    it 'returns false when trying to set a chip in an innexistent square' do
      expect(test_board.try_set_chip(1, 4, 'O')).to be(false)
    end
  end
  describe '#clear' do
    it '#clear makes the testing board empty' do
      test_board.clear
      my_squares = test_board.instance_variable_get(:@squares)
      expect(my_squares[2][2]).to eql(' ')
    end
    it '#clear makes the testing board empty - test2' do
     test_board.clear
      my_squares = test_board.instance_variable_get(:@squares)
      expect(my_squares[0][0]).to eql(' ')
    end
  end
  #To check #draw method is much better to call it in the main program, and seeing if the board is correctly represented.
  #Anaway, this is the test:
  describe '#draw' do
    it "Calls puts 9 times" do
      expect(test_board).to receive(:puts).exactly(9).times
      test_board.draw
    end
  end

  describe '#check_victory' do
    it "There is a victory on a row" do
      test_board.clear
      test_board.try_set_chip(2, 2, 'X')
      test_board.try_set_chip(2, 3, 'X')
      test_board.try_set_chip(2, 1, 'X')
      expect(test_board.check_victory).to eql("XR2")
    end

    it "There is a victory on a column" do
      test_board.clear
      test_board.try_set_chip(2, 2, 'X')
      test_board.try_set_chip(2, 3, 'O')
      test_board.try_set_chip(2, 1, 'X')
      test_board.try_set_chip(1, 3, 'O')
      test_board.try_set_chip(3, 3, 'O')
      expect(test_board.check_victory).to eql("OC3")
    end
    it "There is a victory on a diagonal" do
      test_board.clear
      test_board.try_set_chip(1, 3, 'X')
      test_board.try_set_chip(2, 3, 'O')
      test_board.try_set_chip(2, 2, 'X')
      test_board.try_set_chip(1, 3, 'O')
      test_board.try_set_chip(3, 1, 'X')
      expect(test_board.check_victory).to eql("XD2")
    end
    it "There is no victory" do
      test_board.clear
      test_board.try_set_chip(1, 1, 'X')
      test_board.try_set_chip(1, 2, 'O')
      test_board.try_set_chip(1, 3, 'X')
      test_board.try_set_chip(2, 1, 'X')
      test_board.try_set_chip(2, 2, 'O')
      test_board.try_set_chip(2, 3, 'X')
      test_board.try_set_chip(3, 1, 'O')
      test_board.try_set_chip(3, 2, 'X')
      test_board.try_set_chip(3, 3, 'O')
      expect(test_board.check_victory).to be(false)
    end

  end
end
