# rubocop:disable Metrics/MethodLength
require 'date'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

module Methods
  def list_all_books
    @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
    run
  end

  def list_all_people
    @persons.each do |person|
      puts "[#{person.class.name.split('::').last}] Name: '#{person.name}', ID: #{person.id} , Age: #{person.age}"
    end
    run
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = 0

    person_type = gets.chomp while person_type != '2' && person_type != '1'

    case person_type
    when '1'
      create_student

    when '2'
      create_teacher
    end
    puts 'Person created successfully'
    puts
    run
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp != 'n'
    puts 'create'
    @persons.push(Student.new(age: age, classroom: 'learn to code', name: name, parent_permission: parent_permission))
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @persons.push(Teacher.new(age: age, specialization: specialization, name: name))
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
    puts
    run
  end

  def test_date(date)
    Date.strptime(date, '%d-%m-%Y')
    true
  rescue ArgumentError
    false
  end

  def create_rental
    puts 'Select a book from the following list by number'

    @books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    selected_book = gets.chomp.to_i
    book = @books[selected_book]

    puts 'Select a person from the following list by number (not id)'
    @persons.each_with_index do |person, index|
      puts "#{index}) [Classname] Name: '#{person.name}', ID: #{person.id} , Age: #{person.age}"
    end
    selected_person = gets.chomp.to_i
    person = @persons[selected_person]

    puts 'Enter rental date (dd-mm-yyyy)'
    print 'Date: '
    date = gets.chomp
    if date.match(/\d{2}-\d{2}-\d{4}/) && test_date(date)
      @rentals.push(Rental.new(date: date, person: person, book: book))
      puts 'Rental created successfully'
    else
      puts 'date is not valid'
    end
    puts
    run
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    selected = @rentals.select { |rent| rent.person.id == id }
    selected.each { |s| puts "Date: '#{s.date}', Book: #{s.book.title} , by: #{s.book.author}" }
    run
  end
end
# rubocop:enable Metrics/MethodLength
