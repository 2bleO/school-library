require 'json'

module Data
  def save_data
    books = @books.map { |book| { title: book.title, author: book.author } }
    File.open('books.json', 'w') { |f| f.write JSON.generate(books) }
    File.open('persons.json', 'w') { |f| f.write JSON.generate(@persons) }
    File.open('rentals.json', 'w') { |f| f.write JSON.generate(@rentals) }
  end

  def retrieve_books
    file = 'books.json'

    if File.exist? file
      data = JSON.parse(File.read(file), create_additions: true)
      data.each do |book|
        @books.push(Book.new(book['title'], book['author']))
      end
    else
      []
    end
  end

  def retrieve_persons
    file = 'persons.json'
    return [] unless File.exist? file

    JSON.parse(File.read(file)).map do |person|
      if person['json_class'] == 'Student'
        student = Student.new(name: person['name'],
                              age: person['age'],
                              parent_permission: person['permission'],
                              classroom: @classroom)
        @persons.push(student)
      else
        teacher = Teacher.new(age: person['age'],
                              name: person['name'],
                              specialization: person['specialization'])
        @persons.push(teacher)

      end
      @persons.last.id = person['id']
    end
  end

  def retrieve_rentals
    file = 'rentals.json'

    if File.exist? file
      data = JSON.parse(File.read(file))
      data.each do |rental|
        book = @books.find { |saved_book| saved_book.title == rental['book_title'] }
        person = @persons.find { |saved_person| saved_person.id == rental['person_id'] }
        @rentals.push(Rental.new(date: rental['date'], person: person, book: book))
      end
    else
      []
    end
  end
end
