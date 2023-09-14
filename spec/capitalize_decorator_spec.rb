require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'henok mekonnen') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  it 'capitalizes the correct_name' do
    expect(decorator.correct_name).to eq('Henok mekonnen')
  end
end
