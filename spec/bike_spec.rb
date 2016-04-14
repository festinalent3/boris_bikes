require 'bike'

describe Bike do

  it 'can report status' do
      (expect(subject.report(true)).to eq true) || (expect(subject.report(false)).to eq false)
  end


  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to(:report).with(1).argument }

end
