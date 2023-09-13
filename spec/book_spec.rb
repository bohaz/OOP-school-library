require_relative '../book'
require_relative '../student'
require_relative '../rental'

describe Book do
  person = Student.new(22, 'rr', 'Test')

  it 'Create a new Book class object' do
    book = Book.new('new book', 'h test')
    expect(book.class).to eq Book
  end

  it 'Create a new book with the title Ruby' do
    book = Book.new('Ruby', 'Microverse')
    title = book.title
    expect(title).to eq 'Ruby'
  end

  it 'Create a new book and a rental associated with it' do
    book = Book.new('Ruby', 'Test country')
    rental = Rental.new('01-01-2023', book, person)

    book_rented = rental.book
    rental_date = rental.date

    expect(book_rented).to eq book
    expect(rental_date).to eq '01-01-2023'
  end
end
