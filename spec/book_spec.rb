require 'spec_helper'

describe Book do 
  context 'testing Book with valid arguments' do
    before :each do
      @book = Book.new 'The 5 Love Languages', 'Gary Chapman'
    end
    
    describe '#new' do
      it 'takes two parameters and returns a Book object' do
        expect(@book).to be_an_instance_of(Book)
      end
    end

    describe '#author' do
      it 'returns correct author: Gary Chapman' do
        expect(@book.author).to eql 'Gary Chapman'
      end
    end

    describe '#title' do
      it 'returns correct title: The 5 Love Languages' do
        expect(@book.title).to eql 'The 5 Love Languages'
      end
    end

    describe '#rentals' do
      it 'should have rentals attribute' do
        expect(@book).to have_attributes(rentals: [])
      end
    end

  end
end
