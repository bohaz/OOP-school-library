class Person 
  attr_reader :id, :name, :age
  attr_writer :name, :age

  @@count = 0

  def initialize(name = "Unknown", age, parent_permission = true)
    @@count += 1
    @id = @@count
    @name = name
    @age = age  
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private :of_age?
end