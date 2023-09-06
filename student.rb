require_relative 'person'
attr_reader :classroom

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
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
