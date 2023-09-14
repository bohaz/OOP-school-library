require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable_mock) { double('Nameable') }

  context 'When testing correct_name method of TrimmerDecorator class' do
    it 'should trim the name to a maximum of 10 characters' do
      allow(nameable_mock).to receive(:correct_name).and_return('Henok Recardo Javier')
      decorator = TrimmerDecorator.new(nameable_mock)

      expect(decorator.correct_name).to eq('Henok Reca')
    end

    it 'should not trim names shorter than 10 characters' do
      allow(nameable_mock).to receive(:correct_name).and_return('Heno')
      decorator = TrimmerDecorator.new(nameable_mock)

      expect(decorator.correct_name).to eq('Heno')
    end
    it 'handles an empty name' do
      allow(nameable_mock).to receive(:correct_name).and_return('')
      decorator = TrimmerDecorator.new(nameable_mock)

      expect(decorator.correct_name).to eq('')
    end
    it 'does not trim a 10-character name' do
      allow(nameable_mock).to receive(:correct_name).and_return('1234567890')
      decorator = TrimmerDecorator.new(nameable_mock)

      expect(decorator.correct_name).to eq('1234567890')
    end
  end
end
