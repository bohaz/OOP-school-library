class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.add_rental(self)
    person.add_rental(self)
  end

  def to_h
    {
      'date' => @date,
      'book_title' => @book.title,
      'person_id' => @person.id
    }
  end
end
