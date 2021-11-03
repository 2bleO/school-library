require 'spec_helper'

describe Person do 
  context 'testing Person class' do
    before :all do
      @person1 = Person.new(name: 'Jose', age: 10, parent_permission: true)
      @person2 = Person.new(name: 'Mario', age: 5, parent_permission: false )
      @person3 = Person.new(age: 15)
      @person4 = Person.new(age:20)
    end
    
    describe '#new' do
      it 'returns a Person object' do
        expect(@person1).to be_an_instance_of(Person)
        expect(@person2).to be_an_instance_of(Person)
        expect(@person3).to be_an_instance_of(Person)
      end
    end

    describe '#name' do
      it 'returns correct name' do
        expect(@person1.name).to eql 'Jose'
        expect(@person2.name).to eql 'Mario'
        expect(@person3.name).to eql 'Unknown'
      end
    end

    describe '#id' do
      it 'should have an id' do
        expect(@person1.id).to be_kind_of Numeric
        expect(@person2.id).to be_kind_of Numeric
        expect(@person3.id).to be_kind_of Numeric
      end

      it 'should have different id' do
        expect(@person1.id == @person2.id).to be false
        expect(@person2.id == @person3.id).to be false
      end
    end

    describe '#can_use_services?' do
      it 'returns if minor can use service' do
        expect(@person1.can_use_services?).to be true
        expect(@person2.can_use_services?).to be false
        expect(@person3.can_use_services?).to be true
      end

      it 'Adults should be allowed without parent permission' do
        expect(@person4.can_use_services?).to be_truthy
      end
    end

  end
end
