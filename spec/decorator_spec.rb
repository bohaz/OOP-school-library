require_relative '../decorator' 

describe Decorator do
  let(:nameable_instance) { instance_double('Nameable') }

  before do
    allow(nameable_instance).to receive(:correct_name).and_return('CorrectName')
  end

  subject { Decorator.new(nameable_instance) }

  it 'should delegate correct_name to the wrapped object' do
    expect(subject.correct_name).to eq('CorrectName')
  end
end

describe Nameable do
  it 'should raise a NotImplementedError for correct_name' do
    expect { subject.correct_name }.to raise_error(NotImplementedError)
  end
end
