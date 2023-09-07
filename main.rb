require_relative 'app'

def main
  app = App.new

  loop do
    puts 'Choose an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'

    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      create_person(app)
    when 4
      create_book(app)
    when 5
      create_rental(app)
    when 6
      list_rentals_for_person(app)
    when 7
      puts 'Goodbye!'
      break
    else
      puts 'Invalid choice. Please choose a valid option.'
    end
  end
end

def create_person(app)
  puts 'Enter person type (student/teacher):'
  type = gets.chomp.downcase
  puts 'Enter age:'
  age = gets.chomp.to_i
  puts 'Enter name:'
  name = gets.chomp
  app.create_person(type, age, name)
end

def create_book(app)
  puts 'Enter title:'
  title = gets.chomp
  puts 'Enter author:'
  author = gets.chomp
  app.create_book(title, author)
end

def create_rental(app)
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  puts 'Enter book title:'
  book_title = gets.chomp
  puts 'Enter date (YYYY-MM-DD):'
  date = gets.chomp
  app.create_rental(person_id, book_title, date)
end

def list_rentals_for_person(app)
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  app.list_rentals_for_person(person_id)
end

main
