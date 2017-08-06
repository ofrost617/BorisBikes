require_relative '../lib/docking_station'
require_relative '../lib/bike'

describe DockingStation do

  let(:bike) {double :bike}
  let(:broken_bike) {double :broken_bike}
  it "Recognises release_bike" do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:release_bike)
  end

  it "Bike is working" do
    allow(bike).to receive(:working?)
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
      allow(bike).to receive(:class).and_return(Bike)
      subject.capacity.times {station.dock_bike(bike)}
      expect {station.dock_bike(bike)}.to raise_error "Docking station full"
    end   
  end

  it 'sets a default capacity of 20 when not otherwise specified' do
      expect(DockingStation.new.capacity).to eq 20
  end
  
  it 'capacity is capcity set by user' do
      expect(DockingStation.new(8).capacity).to eq 8
  end
  
  it "can report a bike as broken" do
    allow(bike).to receive(:report_broken)
    allow(bike).to receive(:working?).and_return(false)
    subject.dock_bike(bike, broken = true)
    expect(bike.working?).to eq(false)
  end

  it "docking station wont release broken bike" do
    allow(bike).to receive(:report_broken)
    allow(bike).to receive(:working?).and_return(false)
    subject.dock_bike(bike, broken = true)
    expect {subject.release_bike}.to raise_error "No bikes available"
  end
  
  it "accepts both working and broken bikes" do
    allow(bike).to receive_messages(
      :report_broken => nil,
      :class => Bike,
      :working? => true)
    allow(broken_bike).to receive_messages(
      :report_broken => nil,
      :class => Bike,
      :working? => false)
    subject.dock_bike(bike)
    subject.dock_bike(broken_bike, broken = true)
    expect((subject.bikes[0].working? == true) && (subject.bikes[1].working? == false)).to eq(true)
  end
end

  




# put broken bike in array
# put working bike in array
# expect((@bikes[0].working? == false) && (@bikes[1].working? == true)).to eq(true)