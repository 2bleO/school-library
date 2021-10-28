require_relative 'classroom'
require_relative 'methods'

class App
  include Methods
  attr_accessor :books, :persons, :rentals, :classrooms

  def initialize
    @books = []
    @persons = []
    @rentals = []
    @classrooms = []
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run
    choice = show_options
    choice = show_options while choice < 1 || choice > 7

    case choice
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      puts 'Thank you for using this app!'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def show_options
    options = [
      '1 - list all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - exit'
    ]
    puts
    puts 'Please choose an option by entering a number: '
    puts options
    gets.chomp.to_i
  end
end

def main
  puts 'Welcome to School Library App!'
  puts
  library = App.new
  library.run
end

main
