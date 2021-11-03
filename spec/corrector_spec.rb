require_relative 'spec_helper'

describe Corrector do
  before :all do
    @corrector = Corrector.new
  end

  describe '#correct_name' do
    context 'with downcase name' do
      it 'returns a capitalized name' do
        expect(@corrector.correct_name('EnmaNuel')).to eql 'Enmanuel'
      end
    end

    context 'with more than 10 characters' do
      it 'returns a name max 10 characters long' do
        expect(@corrector.correct_name('EnmanUel Onesis')).to eq 'Enmanuel o'
      end
    end
  end
end
