require_relative 'base_decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()

    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  def to_hash
    hash = {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }

    if is_a?(Teacher)
      hash.merge!(specialization: @specialization)
      hash[:specialization] = @specialization
      hash.delete(:parent_permission)
    else
      hash[:parent_permission] = @parent_permission
    end

    hash
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(10_000..99_999)
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
