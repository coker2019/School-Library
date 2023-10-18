require './rental'
require './store_data'

class RentalsManager
  attr_accessor :rentals, :books_manager, :people_manager

  def initialize(books_manager, people_manager)
    @rentals = []
    @books_manager = books_manager
    @people_manager = people_manager
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @books = read_file('books.json')
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
  
    person = @people_manager.people[person_index]
    rental_data = {
      date: date,
      book: @books_manager.books[book_index].to_hash,       # Convert to hash
      person: {
        id: person.id,
        name: person.name,
        age: person.age,
        parent_permission: person.instance_variable_get(:@parent_permission),
        specialization: person.instance_variable_get(:@specialization)
      }
    }
  
    @rentals << rental_data
    write_file('rental.json', @rentals)
    puts 'Rental created successfully'
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
end