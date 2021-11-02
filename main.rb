require_relative 'app'

puts 'Welcome to School Library App!'
puts
library = App.new
library.get_books
library.get_persons
library.run
