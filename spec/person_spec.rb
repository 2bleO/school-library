require 'spec_helper'

describe Person do
  context 'testing Person class' do
    before :all do
      @person1 = Person.new(name: 'Jose', age: 10, parent_permission: true)
      @person2 = Person.new(age: 20, parent_permission: false )
    end

    describe '#new' do
      it 'returns a Person object' do
        expect(@person1).to be_an_instance_of(Person)
      end
    end

    describe '#name' do
      it 'returns correct name' do
        expect(@person1.name).to eql 'Jose'
        expect(@person2.name).to eql 'Unknown'
      end
    end

    describe '#id' do
      it 'should have an id' do
        expect(@person1.id).to be_kind_of Numeric
      end

      it 'should have different id' do
        expect(@person1.id == @person2.id).to be false
      end
    end

    describe '#can_use_services?' do
      it 'returns if minor can use service' do
        expect(@person1.can_use_services?).to be true

      it 'Adults should be allowed without parent permission' do
        expect(@person2.can_use_services?).to be_truthy
      end
    end
  end
end
