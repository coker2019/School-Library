# class Rental
#   attr_accessor :date, :person, :book

#   def initialize(date, book, person)
#     @date = date
#     @book = book
#     @person = person
#     book.rentals << self
#     person.rentals << self
#   end

#   def to_hash
#     {
#       date: @date,
#       book: @book,
#       person: @person
#     }
#   end
# end
# rental.rb file
class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end

  def to_hash
    {
      date: @date,
      book: @book.to_hash, # Convert book to hash
      person: {
        id: @person.id,
        name: @person.name,
        age: @person.age,
        parent_permission: @person.instance_variable_get(:@parent_permission),
        specialization: @person.instance_variable_get(:@specialization)
      }
    }
  end
end
