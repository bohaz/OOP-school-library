require 'json'
require 'fileutils'
require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

class App
  def initialize
    FileUtils.mkdir_p('./data')
    @people = []
    @books = []
    @rentals = []
    load_data
  end

  def save_data
    File.write('./data/people.json', JSON.dump(@people.map(&:to_h)))
    File.write('./data/books.json', JSON.dump(@books.map(&:to_h)))
    File.write('./data/rentals.json', JSON.dump(@rentals.map(&:to_h)))
  end

  def load_data
    # Load people
    if File.exist?('./data/people.json')
      JSON.parse(File.read('./data/people.json')).each do |person_hash|
        person = Person.new(person_hash['age'], person_hash['name'], parent_permission: person_hash['parent_permission'])
        @people << person
      end
    end
  
    # Load books
    if File.exist?('./data/books.json')
      JSON.parse(File.read('./data/books.json')).each do |book_hash|
        @books << Book.new(book_hash['title'], book_hash['author'])
      end
    end
  
    # Load rentals
    if File.exist?('./data/rentals.json')
      JSON.parse(File.read('./data/rentals.json')).each do |rental_hash|
        book = @books.find { |b| b.title == rental_hash['book_title'] }
        person = @people.find { |p| p.id == rental_hash['person_id'] }
        
        if book.nil? || person.nil?
          puts "Skipping rental: Book or person not found."
          next
        end
        
        @rentals << Rental.new(rental_hash['date'], book, person)
      end
    end
  end

  def list_books
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def create_student(age, name)
    print 'Classrom: '
    classroom = gets.chomp
    Classroom.new(classroom)

    @people.push(Student.new(age, classroom, name, parent_permission: true))
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    case choice
    when 1
      create_student(age, name)
      puts 'Student Created successfully'
      save_data
    when 2
      create_teacher(age, name)
      puts 'Teacher Created successfully'
      save_data
    else
      puts 'Invalid option'
      nil
    end
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name, parent_permission: true)
    @people.push(person)
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully'
    save_data
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books

    book_index = gets.chomp.to_i
    book = @books[book_index]

    puts 'Select a person from the following list by number'
    list_people

    person_index = gets.chomp.to_i
    person = @people[person_index]

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, book, person)
    @rentals << rental

    puts 'Rental created successfully'
    save_data
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    rentals.each { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
  end
end
