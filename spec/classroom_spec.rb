require './classroom'
require './student'

describe Classroom do
  let(:classroom) { Classroom.new('Chemistry') }
  let(:student) { Student.new(18, 'coker', parent_permission: true) }

  it 'should initialize correctly' do
    expect(classroom.label).to eq('Chemistry')
    expect(classroom.students).to be_empty
  end

  it 'should add a student' do
    classroom.add_student(student)
    expect(classroom.students).to include(student)
    expect(student.classroom).to eq(classroom)
  end
end
