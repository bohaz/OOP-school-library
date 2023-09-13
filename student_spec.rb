require_relative '../person'
describe Student do
  let(:student) { Student.new(29, '1A', 'Abebe') }
  it 'inherits from Person' do
    expect(Student.superclass).to eq(Person)
  end
  it 'has a classroom attribute' do
    expect(student.classroom).to eq('1A')
  end
  it 'can play hooky' do
    expect(student.play_hooky).to eq('¯\\_(ツ)_/¯')
  end
  it 'is added to the classroom students list' do
    classroom = double('Classroom', students: [])
    student.classroom = classroom
    expect(classroom.students).to include(student)
  end
  it 'does not add duplicate students to the classroom' do
    classroom = double('Classroom', students: [student])
    student.classroom = classroom
    expect(classroom.students.count(student)).to eq(1)
  end
end
