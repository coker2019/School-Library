require './rental'
require './store_data'

class RentalsManager
  attr_accessor :rentals, :books_manager, :people_manager

  def initialize(books_manager, people_manager)
    @rentals = []
    @books_manager = books_manager
    @people_manager = people_manager
  end

  def list_rentals_for_person
    print 'ID of person: '
    person_id = gets.chomp.to_i
    @rentals = read_file('rental.json')
    puts 'Rentals:'
    person_rentals = @rentals.select do |rental|
      person_id_in_rental = rental['person'].is_a?(Hash) ? rental['person']['id'] : rental['person']
      person_id_in_rental == person_id
    end

    if person_rentals.empty?
      puts 'No rentals found for the given person ID.'
    else
      person_rentals.each do |rental|
        puts "Date: #{rental['date']}, Book \"#{rental['book']['title']}\" by #{rental['book']['author']}"
      end
    end
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    book_index = select_book

    puts "\nSelect a person from the following list by number (not id):"
    person_index = select_person

    print "\nDate: "
    date = gets.chomp

    create_and_save_rental(book_index, person_index, date)
  end

  private

  def select_book
    @books_manager.books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    gets.chomp.to_i
  end

  def select_person
    @people_manager.people.each_with_index do |person, index|
      puts "#{index}) [#{person.classroom}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def create_and_save_rental(book_index, person_index, date)
    person = @people_manager.people[person_index]
    rental_data = {
      date: date,
      book: @books_manager.books[book_index].to_hash, # Convert to hash
      person: person.to_hash # Use to_hash method from Person class
    }

    @rentals << rental_data
    write_file('rental.json', @rentals)
    puts 'Rental created successfully'
  end
end
