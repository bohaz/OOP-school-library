require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  let(:book) { Book.new('Animal Farm', 'George Orwell') }
  let(:person) { Person.new(25, 'John') }
  subject { Rental.new('2023-09-13', book, person) }

  it 'should have a date' do
    expect(subject.date).to eq('2023-09-13')
  end

  describe '#to_h' do
    it 'returns a hash representation of the rental' do
      allow(book).to receive(:title).and_return('Animal Farm')
      allow(person).to receive(:id).and_return(1)
      
      expected_hash = {
        'date' => '2023-09-13',
        'book_title' => 'Animal Farm',
        'person_id' => 1
      }

      expect(subject.to_h).to eq(expected_hash)
    end
  end
end
