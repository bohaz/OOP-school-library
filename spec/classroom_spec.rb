require_relative '../classroom'

describe Classroom do
  subject { Classroom.new('Programming') }

  it 'should have a label' do
    expect(subject.label).to eq('Programming')
  end
end
