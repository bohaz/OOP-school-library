require_relative '../rental'

describe Rental do
  let(:book) { Book.new('Animal Farm', 'George Orwell') }
  let(:person) { Person.new(25, 'John') }
  subject { Rental.new('2023-09-13', book, person) }

  it 'should have a date' do
    expect(subject.date).to eq('2023-09-13')
  end
end
