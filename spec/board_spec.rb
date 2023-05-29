# board_spec.rb
require './lib/board'
require './lib/player'

describe Board do
  subject(:board) { Board.new }
  let(:player1) { Player.new('Jamie', 'red') }
  let(:player2) { Player.new('Angela', 'yellow') }

  describe '#play' do
    context 'When player1 inserts a piece into column 0 of an empty board' do
      it 'puts the value `red` in the matrix cell [0,0]' do
        column = 0
        board.play(player1, column)
        expect(board.board_matrix[0, 0]).to eq('red')
      end
    end

    context 'When player2 inserts a piece into column 0 of an empty board after player 1' do
      it 'puts the value `yellow` in the matrix cell [0,1]' do
        column = 0
        board.play(player1, column)
        board.play(player2, column)
        expect(board.board_matrix[0, 1]).to eq('yellow')
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
end
