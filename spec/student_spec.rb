require 'spec_helper'

describe Student do
  context 'testing Student class' do
    before :all do
      @classroom = Classroom.new('Microverse')
      @student1 = Student.new(age: 18, classroom: @classroom)
      @student2 = Student.new(age: 15, classroom: @classroom)
    end

    describe '#new' do
      it 'returns a Student object' do
        expect(@student1).to be_an_instance_of Student
        expect(@student2).to be_an_instance_of Student
      end

      it 'should be added to the correct classroom' do
        expect(@student1.classroom.label).to eql 'Microverse'
      end
    end

    describe '#play_hooky' do
      it 'should print the correct message' do
        expect(@student1.play_hoky).to eql '¯\(ツ)/¯'
      end
    end

    describe '#id' do
      it 'returns id of student' do
        expect(@student1.id).to be_kind_of Numeric
        expect(@student2.id).to be_kind_of Numeric
      end
    end
  end
end
