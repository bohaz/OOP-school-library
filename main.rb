require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def run
    loop do
      puts "\nPlease choose an option by entering a number:"
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'

      choice = gets.chomp.to_i

      case choice
      when 1
        @app.list_books
      when 2
        @app.list_people
      when 3
        @app.create_person
      when 4
        @app.create_book
      when 5
        @app.create_rental
      when 6
        @app.list_rentals_by_person_id
      when 7
        puts 'Thank you for using this app!'
        break
      else
        puts 'Invalid option. Please enter a number between 1 and 7.'
      end
    end
  end
end

main = Main.new
main.run
