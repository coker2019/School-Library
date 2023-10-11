class ClassRoom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    students << student
    student.classroom = self # Set the student's classroom to this classroom.
  end
end
