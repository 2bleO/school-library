require_relative 'spec_helper'

describe Rental do
  before :each do
    @person = Student.new(age: 15, classroom: 'Microverse', name: 'Louis')
    @book = Book.new('Memoria de Mis Putas Tristes', 'Gabriel Garcia Marquez')
    @rental = Rental.new(date: '09-10-2021', person: @person, book: @book)
  end

  context '#new' do
    it 'returns a Rental object' do
      expect(@rental).to be_an_instance_of Rental
    end

    it 'should set the correct date' do
      expect(@rental.date).to eql '09-10-2021'
    end

    it 'should set the correct person' do
      expect(@rental.person).to eql @person
    end

    it 'should set the correct book' do
      expect(@rental.book).to eql @book
    end
  end

  context '#person' do
    it 'should have the correct rental' do
      expect(@person.rentals).to include(@rental)
    end
  end

  context '#book' do
    it 'should have the correct rental' do
      expect(@book.rentals).to include(@rental)
    end
  end
end
