require 'spec_helper'

describe PtvTimetable::API do

  let(:subject){ PtvTimetable::API.new('devid', 'secret') }

  it "should have a test" do
    true.should be_true
  end

end
