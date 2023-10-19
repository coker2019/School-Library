require './book'
require './store_data'

class BooksManager
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_of_books
    puts 'List of Books:'
    @books.each do |book|
      @books = read_file('books.json')
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    puts
  end

  def create_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    write_file('books.json', @books)
    puts 'Book created successfully.'
  end
end
