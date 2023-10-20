require './student'

describe Student do
  let(:student) { Student.new(24, 'coker', parent_permission: true, classroom: 'Chemistry') }

  it 'should initialize correctly' do
    expect(student.age).to eq(24)
    expect(student.name).to eq('coker')
    expect(student.classroom).to eq('Chemistry')
  end

  it 'should play hooky' do
    expect(student.play_hooky).to eq('¯\(ツ)/¯')
  end

  it 'should display info' do
    expect(student.display_info).to include('[Student]')
    expect(student.display_info).to include('name: coker')
    expect(student.display_info).to include('Age: 24')
  end
end
