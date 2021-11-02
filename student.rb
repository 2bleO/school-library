require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hoky
    '¯\\(ツ)/¯'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      :id => id,
      :age => age,
      :name => name,
      :parent_permission => @parent_permission
    }.to_json(*args)
  end
end
