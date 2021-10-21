require_relative 'corrector'

class Person
  
  def initialize(name: 'Unknown', age:, parent_permission: true)
    @id = Random.rand(1..10000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def name=(name)
    @name = name
  end

  def age=(age)
    @age = age
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private
  def is_of_age?
    @age>=18
  end

end
