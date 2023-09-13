require_relative '../person'
require_relative '../decorator'

describe Person do
  let(:person) { Person.new(26, 'Henok') }

  it 'has an ID, name, age, and parent_permission' do
    expect(person.id).not_to be_nil
    expect(person.name).to eq('Henok')
    expect(person.age).to eq(26)
    expect(person.instance_variable_get(:@parent_permission)).to be true
  end

  it 'can use services if of age or with parent permission' do
    adult_person = Person.new(26, 'Henok', parent_permission: false)
    child_with_permission = Person.new(12, 'hirut', parent_permission: true)
    child_without_permission = Person.new(12, 'baby', parent_permission: false)

    expect(adult_person.can_use_services?).to be true
    expect(child_with_permission.can_use_services?).to be true
    expect(child_without_permission.can_use_services?).to be false
  end

  it 'adds rentals' do
    rental = double('Rental')
    person.add_rental(rental)

    expect(person.rentals).to include(rental)
  end

  it 'returns a hash representation' do
    expected_hash = {
      'id' => person.id,
      'name' => 'Henok',
      'age' => 26,
      'parent_permission' => true
    }

    expect(person.to_h).to eq(expected_hash)
  end
  it 'returns correct_name when decorated with CapitalizeDecorator' do
    decorated_person = CapitalizeDecorator.new(person)
    allow(person).to receive(:correct_name).and_return('henok')

    expect(decorated_person.correct_name).to eq('Henok')
  end

  it 'returns trimmed name when decorated with TrimmerDecorator' do
    decorated_person = TrimmerDecorator.new(person)
    allow(person).to receive(:correct_name).and_return('A very long name that needs trimming')

    expect(decorated_person.correct_name).to eq('A very lon')
  end
  
end