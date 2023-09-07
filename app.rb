require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def create_person(type, age, name)
    if type == 'student'
      classroom = ask_for_classroom
      person = Student.new(age, classroom, name)
    elsif type == 'teacher'
      specialization = ask_for_specialization
      person = Teacher.new(age, specialization, name)
    else
      puts 'Invalid person type.'
      return
    end
    @people << person
    puts "Person created: Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "Book created: Title: #{book.title}, Author: #{book.author}"
  end

  def create_rental(person_id, book_title, date)
    person = find_person_by_id(person_id)
    book = find_book_by_title(book_title)

    if person && book
      rental = Rental.new(date, book, person)
      @rentals << rental
      puts "Rental created: Book: #{book.title}, Person: #{person.name}, Date: #{rental.date}"
    else
      puts 'Person or book not found.'
    end
  end

  def list_rentals_for_person(person_id)
    person = find_person_by_id(person_id)

    if person
      puts "Rentals for #{person.name}:"
      rentals = @rentals.select { |rental| rental.person == person }
      rentals.each do |rental|
        puts "Book: #{rental.book.title}, Date: #{rental.date}"
      end
    else
      puts 'Person not found.'
    end
  end

  private

  def ask_for_classroom
    puts 'Enter classroom label:'
    label = gets.chomp
    Classroom.new(label)
  end

  def ask_for_specialization
    puts 'Enter specialization:'
    gets.chomp
  end

  def find_person_by_id(person_id)
    @people.find { |person| person.id == person_id }
  end

  def find_book_by_title(book_title)
    @books.find { |book| book.title == book_title }
  end
end
