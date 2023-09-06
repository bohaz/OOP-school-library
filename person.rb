require_relative 'nameable'

class Person < Nameable
  attr_reader :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @rentals = []
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
  end
end
