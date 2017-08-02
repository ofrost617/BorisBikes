require_relative '../lib/bike'

describe Bike do
  it "Recognises .working? method" do
    bike=Bike.new
    expect(bike).to respond_to(:working?)
  end
  
end
