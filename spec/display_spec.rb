# display_spec.rb
require './lib/display'

describe Display do
  subject(:display) { Display.new }

  describe '#prompt_for_name' do
    context "When entering the text 'Dean'" do
      before do
        allow(display).to receive(gets.chomp).and_return('Dean')
      end

      it "returns the text 'Dean'" do
        expect(display.prompt_for_name('Player 1')).to eq('Dean')
      end
    end
  end

  describe '#prompt_for_play' do
    context do
      xit do
      end
    end
  end
end
