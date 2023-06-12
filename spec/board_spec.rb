# board_spec.rb
# rubocop:disable Metrics/BlockLength
require './lib/board'
require './lib/player'

describe Board do
  subject(:board) { Board.new }
  let(:player1) { Player.new('Jamie', 'red') }
  let(:player2) { Player.new('Angela', 'blue') }

  describe '#play' do
    context 'When player1 inserts a piece into column 0 of an empty board' do
      it 'puts the value `"\e[0;31;49m◯\e[0m"` in the matrix cell [0,0]' do
        column = 0
        board.play(player1, column)
        expect(board.board_matrix[0, 0]).to eq("\e[0;31;49m◯\e[0m")
      end
    end

    context 'When player2 inserts a piece into column 0 of an empty board after player 1' do
      it 'puts the value `"\e[0;34;49m◯\e[0m"` in the matrix cell [1,0]' do
        column = 0
        board.play(player1, column)
        board.play(player2, column)
        expect(board.board_matrix[1, 0]).to eq("\e[0;34;49m◯\e[0m")
      end
    end

    context 'When a player inserts a piece into a full column' do
      subject(:board) { Board.new(Matrix.build(6, 7) { 'filled' }) }
      it 'raises a ColumnFull error' do
        column = 0
        expect { board.play(player1, column) }.to raise_error(ColumnFull)
      end
    end
  end

  describe '#full?' do
    context 'When a board is not full' do
      subject(:board) { Board.new }
      it 'returns false' do
        expect(board.full?).to eq(false)
      end
    end

    context 'When a board is full' do
      subject(:board) { Board.new(Matrix.build(6, 7) { 'filled' }) }
      it 'returns true' do
        expect(board.full?).to eq(true)
      end
    end
  end

  describe '#game_over?' do
    let(:player1) { Player.new('Jamie', 'red') }
    let(:player2) { Player.new('Angela', 'yellow') }
    context 'When four consecutive red tokens are in the same row' do
      subject(:board) { Board.new }
      it 'returns true' do
        board.play(player1, 0)
        board.play(player1, 1)
        board.play(player1, 2)
        board.play(player1, 3)
        expect(board.game_over?).to eq(true)
      end
    end

    context 'When four consecutive red tokens are in the same column' do
      subject(:board) { Board.new }
      it 'returns true' do
        board.play(player1, 0)
        board.play(player1, 0)
        board.play(player1, 0)
        board.play(player1, 0)
        expect(board.game_over?).to eq(true)
      end
    end

    context 'When four consecutive red tokens are in an ascending diagonal' do
      subject(:board) { Board.new }
      it 'returns true' do
        board.play(player1, 0)
        board.play(player2, 1)
        board.play(player1, 1)
        board.play(player2, 2)
        board.play(player2, 2)
        board.play(player1, 2)
        board.play(player1, 3)
        board.play(player1, 3)
        board.play(player2, 3)
        board.play(player1, 3)
        expect(board.game_over?).to eq(true)
      end
    end

    context 'When four consecutive red tokens are in a descending diagonal' do
      subject(:board) { Board.new }
      it 'returns true' do
        board.play(player1, 0)
        board.play(player2, 0)
        board.play(player2, 0)
        board.play(player1, 0)
        board.play(player2, 1)
        board.play(player1, 1)
        board.play(player1, 1)
        board.play(player2, 2)
        board.play(player1, 2)
        board.play(player1, 3)
        expect(board.game_over?).to eq(true)
      end
    end

    context 'When there are no consecutive tokens of either color in any direction' do
      subject(:board) { Board.new }
      it 'returns false' do
        expect(board.game_over?).to eq(false)
      end
    end
  end
end
