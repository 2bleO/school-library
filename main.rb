require_relative 'app'

puts 'Welcome to School Library App!'
puts
library = App.new
library.retrieve_books
library.retrieve_persons
library.retrieve_rentals
library.run
