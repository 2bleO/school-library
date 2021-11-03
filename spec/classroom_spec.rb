require 'spec_helper'

describe Teacher do 
  context 'testing Student class' do
    before :all do
      @classroom = Classroom.new('Microverse')
      @student = Student.new(age: 17, classroom: @classroom)
      @classroom.add_student @student
    end

    describe '#new' do
      it 'returns a Classroom object' do
        expect(@classroom).to be_an_instance_of Classroom
      end
    end

    describe '#students' do
      it 'has Student' do
        expect(@classroom.students).to include(@student)
      end
    end

    describe '#label' do
      it 'returns the correct label' do
        expect(@classroom.label).to eql 'Microverse'
      end
    end

  end
end
