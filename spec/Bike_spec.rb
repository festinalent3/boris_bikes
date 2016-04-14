require 'bike'

describe Bike do

  it { is_expected.to respond_to(:working) }

  it 'can report status' do
    expect(subject.report_status(true)) == true || expect(subject.report_status(false)) == false
  end

end
