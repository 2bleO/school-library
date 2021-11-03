require 'spec_helper'

describe Teacher do 
  context 'testing Student class' do
    before :all do
      @teacher1 = Teacher.new(age: 55, specialization: 'Math', name: 'Pedro')
      @teacher2 = Teacher.new(age: 40, specialization: 'Arts')   
    end

    describe '#new' do
      it 'returns a Teacher object' do
        expect(@teacher1).to be_an_instance_of Teacher
        expect(@teacher2).to be_an_instance_of Teacher
      end
    end

    describe '#name' do
      it 'returns correct name' do
        expect(@teacher1.name).to eql 'Pedro'
        expect(@teacher2.name).to eql 'Unknown'
      end
    end

    describe '#id' do
      it 'returns id of Teacher' do
        expect(@teacher1.id).to be_kind_of Numeric
        expect(@teacher2.id).to be_kind_of Numeric
      end

      it 'should have different id' do
        expect(@teacher1.id == @teacher2.id).to be false
      end
    end

    describe '#can_use_services?' do
      it 'returns boolean value' do
        expect(@teacher1.can_use_services?).to eql true
        expect(@teacher2.can_use_services?).to eql true
      end
    end

  end
end
