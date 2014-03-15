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

  it 'can search near me' do
    stub = stub_request(:get, "http://timetableapi.ptv.vic.gov.au/v2/nearme/latitude/-37.82392124423254/longitude/144.9462017431463?devid=devid&signature=DA23BFC88EB80BF3EB0AC59AF5846159C0F6EFE2")
    subject.near_me(-37.82392124423254, 144.9462017431463)
    stub.should have_been_requested
  end

  it 'can find points of interest' do
    stub = stub_request(:get, "http://timetableapi.ptv.vic.gov.au/v2/poi/0,1,2,3,4,100/lat1/-37.82205143151239/long1/144.9779160007277/lat2/-37.81393456848758/long2/-37.81393456848758/griddepth/3/limit/6?devid=devid&signature=F94A5E7774028E67B6684B17E1C49886C5BEFBC9")
    subject.points_of_interest(-37.82205143151239, 144.9779160007277, -37.81393456848758, 144.9859159992726)
    stub.should have_been_requested
  end

  it 'can perform a general search' do
    stub = stub_request(:get, "http://timetableapi.ptv.vic.gov.au/v2/search/Alamein?devid=devid&signature=17E15574BF165335DD054E02FC5F8C5C33189262")
    subject.search('Alamein')
    stub.should have_been_requested
  end

  it 'can lookup broad next departures' do
    stub = stub_request(:get, "http://timetableapi.ptv.vic.gov.au/v2/mode/2/stop/28905/departures/by-destination/limit/5?devid=devid&signature=8AB75EF37D089BDD055327FB8559350215CFBFB4")
    subject.broad_next_departures(PtvTimetable::BUS, 28905)
    stub.should have_been_requested
  end

  it 'can lookup specific next departures' do
    Time.stub(:now) { Time.new(0) }
    stub = stub_request(:get, "http://timetableapi.ptv.vic.gov.au/v2/mode/2/line/5111/stop/2896/directionid/28905/departures/all/limit/515?devid=devid&for_utc=-0001-12-31T14:00:00Z&signature=04CBABE713BA7F5176406FFE039961A643CE64E7")
    subject.specific_next_departures(PtvTimetable::BUS, 5111, 2896, 28905, 515)
    stub.should have_been_requested
  end

  it 'can lookup a stopping pattern' do
    stub = stub_request(:get, "http://timetableapi.ptv.vic.gov.au/v2/mode/2/run/1464/stop/1108/stopping-pattern?devid=devid&for_utc=2013-11-13T05:24:25Z&signature=345F61EE77EFD7D25E56672D84CFC1D37C794EF5")
    subject.stopping_pattern(PtvTimetable::BUS, 1464, 1108, '2013-11-13T05:24:25Z')
    stub.should have_been_requested
  end

  it 'can lookup stops on a line' do
    stub = stub_request(:get, "http://timetableapi.ptv.vic.gov.au/v2/mode/2/line/1818/stops-for-line?devid=devid&signature=42FE7A31C9474B199DC38BE4E23ADA606878DF6A")
    subject.line_stops(PtvTimetable::BUS, 1818)
    stub.should have_been_requested
  end

end
