require_relative '../lib/docking_station'
require_relative '../lib/bike'

describe DockingStation do

  it "Recognises release_bike" do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:release_bike)
  end

  it "Bike is working" do
    bike = Bike.new
    expect(bike).to respond_to(:working?)
  end
  
end


