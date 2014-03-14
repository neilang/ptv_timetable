require 'spec_helper'

describe PtvTimetable::API do

  let(:subject){ PtvTimetable::API.new('devid', 'secret') }

  it "should treat the devid and secret as required" do
    expect{
      PtvTimetable::API.new
    }.to raise_error(ArgumentError)
  end

  it 'can request a health check' do
    Time.stub(:now) { Time.new(0) }
    stub = stub_request(:get, "http://timetableapi.ptv.vic.gov.au/v2/healthcheck?devid=devid&signature=1306C7D86586C5A3AABECB58581C7CF2A1D4638E&timestamp=-0001-12-31T14:00:00Z")
    subject.health_check
    stub.should have_been_requested
  end

end
