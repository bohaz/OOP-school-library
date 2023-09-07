require_relative 'person'

class Student < Person
  attr_reader :classroom
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
