require_relative '../teacher'
describe Teacher do
  subject { Teacher.new(40, 'Mathematics', 'Eve') }
  it 'should have a specialization' do
    expect(subject.specialization).to eq('Mathematics')
  end

  it 'should be able to use services' do
    expect(subject.can_use_services?).to eq(true)
  end
end
