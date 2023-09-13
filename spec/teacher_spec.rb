require_relative '../teacher'
describe Teacher do
  subject { Teacher.new(40, 'Mathematics', 'Eve') }
  it 'should have a specialization' do
    expect(subject.specialization).to eq('Mathematics')
  end
end
