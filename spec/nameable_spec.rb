require_relative '../nameable'

class DummyNameable < Nameable
end

describe Nameable do
  it 'raises NotImplementedError when correct_name is not implemented' do
    dummy_nameable = DummyNameable.new

    expect { dummy_nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
