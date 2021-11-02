require_relative 'corrector'

class Person
  attr_accessor :name, :age, :rentals, :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rentals(rental)
    @rentals.push(rental)
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end

  def to_s
    "Name: #{@name}, id: #{@id}, Age: #{@age}"
  end
end
