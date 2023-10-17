require './rental'

class RentalsManager
  attr_accessor :rentals, :books_manager, :people_manager
  def initialize(books_manager, people_manager)
    @rentals = []
    @books_manager = books_manager
    @people_manager = people_manager
  end
  def create_rental
    puts 'Select a book from the following list by number:'
    @books_manager.books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts "\nSelect a person from the following list by number (not id):"
    @people_manager.people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print "\nDate: "
    date = gets.chomp
    @rentals << Rental.new(date, @books_manager.books[book_index], @people_manager.people[person_index])
    puts 'Rental created successfully'
  end
  
end