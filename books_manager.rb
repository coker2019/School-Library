require './book'

class BooksManager
    attr_accessor :books
    
    def initialize
        @books = []
    end
    def list_of_books
        puts 'List of Books:'
        @books.each do |book|
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
        puts 'Book created successfully.'
      end
end


