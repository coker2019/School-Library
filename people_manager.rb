require './student'
require './teacher'
require './store_data'

class PeopleManager
  attr_accessor :people

  def initialize
    @people = []
  end

  def list_of_people
    puts 'List of pepple'
    @people = read_file('people.json')
    @people.each do |person_data|
      person = create_person_instance(person_data)
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person_instance(person_data)
    if person_data['specialization']
      Teacher.new(
        person_data['age'],
        person_data['name'],
        parent_permission: person_data['parent_permission'],
        specialization: person_data['specialization']
      )
    else
      Student.new(person_data['age'], person_data['name'], parent_permission: person_data['parent_permission'])
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    if person_type == 2
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(age, name, parent_permission: true, specialization: specialization)
    else
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      @people << Student.new(age, name, parent_permission: parent_permission)
    end
    write_file('people.json', @people)

    puts 'Person created successfully'
  end
end
