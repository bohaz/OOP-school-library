require_relative '../classroom'
require_relative '../student'

describe Classroom do
  subject { Classroom.new('Programming') }

  it 'should have a label' do
    expect(subject.label).to eq('Programming')
  end

  describe '#add_student' do
    let(:student) { Student.new(20, subject, 'John Doe') }

    it 'should add a student to the classroom' do
      subject.add_student(student)
      expect(subject.students).to include(student)
    end

    it 'should associate the classroom with the student' do
      subject.add_student(student)
      expect(student.classroom).to eq(subject)
    end
  end
end
