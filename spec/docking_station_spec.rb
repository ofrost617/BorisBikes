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
  
  it "Dock my bike" do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:dock_bike)
  end
  
  it "My bike is docked in station" do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:bike_been_docked?)
  end
  
  describe "#release_bike" do
    it "Release bike but none there" do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end
  
  describe "#dock_bike" do
    it "No space to dock bike" do
      station = DockingStation.new
      20.times {station.dock_bike(Bike.new)}
      expect {station.dock_bike(Bike.new)}.to raise_error "Docking station full"
    end   
  end

end
  

# expect(obj.respon_to? :my_method).to eq true is another way of writing a test.


